﻿using System;
using System.Collections.Generic;

namespace WebAppDB.Models;

public partial class LearnersCollaboration
{
    public int LearnerId { get; set; }

    public int QuestId { get; set; }

    public string? Completion { get; set; }

    public virtual Learner Learner { get; set; } = null!;

    public virtual Collaborative Quest { get; set; } = null!;
}
