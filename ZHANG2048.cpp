#include "ZHANG2048.h"
#include <QDebug>
#include <ctime>

ZHANG2048::ZHANG2048(QObject *parent)
    : QObject(parent)
{
    m_bestScore = 0;
    connect(this, SIGNAL(backed()), this, SLOT(goBack()));
    srand(time(0));
}

ZHANG2048::~ZHANG2048()
{
}

void ZHANG2048::start()
{
    initNum();
}

void ZHANG2048::move(Move_Direction direction)
{
    added(direction);
    moved(direction);
    freshed(m_addedFlag || m_movedFlag);
    if(m_bestScore < m_score) {
        m_bestScore = m_score;
    }
}

QColor ZHANG2048::color(const int &index)
{
    int number = m_number[index];
    QColor color;
    switch(number) {
    case 0: color = QColor(185, 174, 159); break;
    case 2: color = QColor(237, 221, 198); break;
    case 4: color = QColor(240, 174, 122); break;
    case 8: color = QColor(238, 207, 166); break;
    case 16: color = QColor(244, 148, 100); break;
    case 32: color = QColor(244, 123, 96); break;
    case 64: color = QColor(243, 93, 58); break;
    case 128: color = QColor(235,195, 1); break;
    case 256: color = QColor(235,195, 1); break;
    case 512: color = QColor(235,195, 1); break;
    case 1024: color = QColor(235,195, 1); break;
    case 2048: color = QColor(235,195, 1); break;
    default: color = QColor(0, 0, 0); break;
    }
    return color;
}

QColor ZHANG2048::numColor(const int &index)
{
    if(8192 > m_number[index]) {
        return QColor(0, 0, 0);
    } else {
        return QColor(255, 255, 255);
    }
}

int ZHANG2048::score() const
{
    return m_score;
}

int ZHANG2048::bestScore() const
{
    return m_bestScore;
}

int ZHANG2048::step() const
{
    return m_step;
}

int ZHANG2048::totalStep() const
{
    return m_totalStep;
}


int ZHANG2048::show(const int &index)
{
    return m_number[index];
}

void ZHANG2048::goBack()
{
    if(0 < m_step) {
        m_number = m_state[m_step - 1];
        m_state.pop_back();
        m_step -= 1;
    }
}

void ZHANG2048::initNum()
{
    m_number.clear();
    m_number = NEPanel(16, 0);
    int firstNum = rand() % 16;
    int secondNum = rand() % 16;
    while(firstNum == secondNum) {
        secondNum = rand() % 16;
    }
    m_number[firstNum] = 2;
    m_number[secondNum] = 2;
    m_score = 0;
    m_step = 0;
    m_totalStep = 0;
    m_state.clear();
    m_state.push_back(m_number);
}

void ZHANG2048::added(Move_Direction direction)
{
    if(Move_Down == direction) {
        m_addedFlag = false;
        for(int c = 0; c < COLUMNS; c++) {
            m_preIndex = c;
            m_nextIndex = m_preIndex + 4;
            while(m_nextIndex <= c + 12) {
                if(0 == m_number[m_preIndex]) {
                    m_preIndex = m_nextIndex;
                    m_nextIndex = m_preIndex + 4;
                    continue;
                }
                if(0 == m_number[m_nextIndex]) {
                    m_nextIndex += 4;
                    continue;
                }
                if(m_number[m_preIndex] != m_number[m_nextIndex]) {
                    m_preIndex = m_nextIndex;
                    m_nextIndex = m_preIndex + 4;
                } else {
                    m_number[m_preIndex] = 0;
                    m_number[m_nextIndex] += m_number[m_nextIndex];
                    m_score += m_number[m_nextIndex];
                    m_preIndex = m_nextIndex + 4;
                    m_nextIndex = m_preIndex + 4;
                    m_addedFlag = true;
                }
            }
        }
    }

    if(Move_Up == direction) {
        m_addedFlag = false;
        for(int c = 0; c < COLUMNS; c++) {
            m_preIndex = c + 12;
            m_nextIndex = m_preIndex - 4;
            while(m_nextIndex >= c) {
                if(0 == m_number[m_preIndex]) {
                    m_preIndex = m_nextIndex;
                    m_nextIndex = m_preIndex - 4;
                    continue;
                }
                if(0 == m_number[m_nextIndex]) {
                    m_nextIndex -= 4;
                    continue;
                }
                if(m_number[m_preIndex] != m_number[m_nextIndex]) {
                    m_preIndex = m_nextIndex;
                    m_nextIndex = m_preIndex - 4;
                } else {
                    m_number[m_preIndex] = 0;
                    m_number[m_nextIndex] += m_number[m_nextIndex];
                    m_score += m_number[m_nextIndex];
                    m_preIndex = m_nextIndex - 4;
                    m_nextIndex = m_preIndex - 4;
                    m_addedFlag = true;
                }
            }
        }
    }

    if(Move_Right == direction) {
        m_addedFlag = false;
        for(int r = 0; r < ROWS; r++) {
            m_preIndex = r * 4;
            m_nextIndex = m_preIndex + 1;
            while(m_nextIndex <= r * 4 + 3) {
                if(0 == m_number[m_preIndex]) {
                    m_preIndex = m_nextIndex;
                    m_nextIndex = m_preIndex + 1;
                    continue;
                }
                if(0 == m_number[m_nextIndex]) {
                    m_nextIndex += 1;
                    continue;
                }
                if(m_number[m_preIndex] != m_number[m_nextIndex]) {
                    m_preIndex = m_nextIndex;
                    m_nextIndex = m_preIndex + 1;
                } else {
                    m_number[m_preIndex] = 0;
                    m_number[m_nextIndex] += m_number[m_nextIndex];
                    m_score += m_number[m_nextIndex];
                    m_preIndex = m_nextIndex + 1;
                    m_nextIndex = m_preIndex + 1;
                    m_addedFlag = true;
                }
            }
        }
    }

    if(Move_Left == direction) {
        m_addedFlag = false;
        for(int r = 0; r < ROWS; r++) {
            m_preIndex = r * 4 + 3;
            m_nextIndex = m_preIndex - 1;
            while(m_nextIndex >= r * 4) {
                if(0 == m_number[m_preIndex]) {
                    m_preIndex = m_nextIndex;
                    m_nextIndex = m_preIndex - 1;
                    continue;
                }
                if(0 == m_number[m_nextIndex]) {
                    m_nextIndex -= 1;
                    continue;
                }
                if(m_number[m_preIndex] != m_number[m_nextIndex]) {
                    m_preIndex = m_nextIndex;
                    m_nextIndex = m_preIndex - 1;
                } else {
                    m_number[m_preIndex] = 0;
                    m_number[m_nextIndex] += m_number[m_nextIndex];
                    m_score += m_number[m_nextIndex];
                    m_preIndex = m_nextIndex - 1;
                    m_nextIndex = m_preIndex - 1;
                    m_addedFlag = true;
                }
            }
        }
    }
}

void ZHANG2048::moved(Move_Direction direction)
{
    if(Move_Down == direction) {
        m_movedFlag = false;
        for(int c = 0; c < COLUMNS; c++) {
            m_preIndex = c + 12;
            m_nextIndex = m_preIndex - 4;
            while(m_nextIndex >= c) {
                if(0 != m_number[m_preIndex]) {
                    m_preIndex = m_nextIndex;
                    m_nextIndex = m_preIndex - 4;
                    continue;
                }
                if(0 == m_number[m_nextIndex]) {
                    m_nextIndex -= 4;
                    continue;
                } else {
                    m_number[m_preIndex] = m_number[m_nextIndex];
                    m_number[m_nextIndex] = 0;
                    m_preIndex = m_preIndex - 4;
                    m_nextIndex = m_nextIndex - 4;
                    m_movedFlag = true;
                }
            }
        }
    }

    if(Move_Up == direction) {
        m_movedFlag = false;
        for(int c = 0; c < COLUMNS; c++) {
            m_preIndex = c;
            m_nextIndex = m_preIndex + 4;
            while(m_nextIndex <= c + 12) {
                if(0 != m_number[m_preIndex]) {
                    m_preIndex = m_nextIndex;
                    m_nextIndex = m_preIndex + 4;
                    continue;
                }
                if(0 == m_number[m_nextIndex]) {
                    m_nextIndex += 4;
                    continue;
                } else {
                    m_number[m_preIndex] = m_number[m_nextIndex];
                    m_number[m_nextIndex] = 0;
                    m_preIndex = m_preIndex + 4;
                    m_nextIndex = m_nextIndex + 4;
                    m_movedFlag = true;
                }
            }
        }
    }

    if(Move_Right == direction) {
        m_movedFlag = false;
        for(int r = 0; r < ROWS; r++) {
            m_preIndex = r * 4 + 3;
            m_nextIndex = m_preIndex - 1;
            while(m_nextIndex >= r * 4) {
                if(0 != m_number[m_preIndex]) {
                    m_preIndex = m_nextIndex;
                    m_nextIndex = m_preIndex - 1;
                    continue;
                }
                if(0 == m_number[m_nextIndex]) {
                    m_nextIndex -= 1;
                    continue;
                } else {
                    m_number[m_preIndex] = m_number[m_nextIndex];
                    m_number[m_nextIndex] = 0;
                    m_preIndex = m_preIndex - 1;
                    m_nextIndex = m_nextIndex - 1;
                    m_movedFlag = true;
                }
            }
        }
    }

    if(Move_Left == direction) {
        m_movedFlag = false;
        for(int r = 0; r < ROWS; r++) {
            m_preIndex = r * 4;
            m_nextIndex = m_preIndex + 1;
            while(m_nextIndex <= r * 4 + 3) {
                if(0 != m_number[m_preIndex]) {
                    m_preIndex = m_nextIndex;
                    m_nextIndex = m_preIndex + 1;
                    continue;
                }
                if(0 == m_number[m_nextIndex]) {
                    m_nextIndex += 1;
                    continue;
                } else {
                    m_number[m_preIndex] = m_number[m_nextIndex];
                    m_number[m_nextIndex] = 0;
                    m_preIndex = m_preIndex + 1;
                    m_nextIndex = m_nextIndex + 1;
                    m_movedFlag = true;
                }
            }
        }
    }
}

void ZHANG2048::freshed(bool fresh)
{
    if(fresh) {
        m_step += 1;
        m_totalStep = m_step;
        m_index.clear();
        for(size_t s = 0; s < m_number.size(); s++) {
            if(!m_number[s]) {
                m_index.push_back(s);
            }
        }
        int randIndex = rand() % m_index.size();
        m_number[m_index[randIndex]] = 2;
        m_state.push_back(m_number);
    }
}
