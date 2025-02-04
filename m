Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A832066D8
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 07:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655735; cv=none; b=Z+4k1I7y5d281Q5rugcx0c9gZUzk+q8mISHTk7rnXaAXHTnzISDkW/FRB3kjN+BmULai7wUAnqlwteeCqiGXAV81PoFvFRVhG6faiiQmQN4hT8JcQd91qb7ack2hNFbHhEn8Kq5i/8LKdcMU3hQaLlJ0VYe5tmv/Nx4cIZbevew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655735; c=relaxed/simple;
	bh=uNWzr1J0Ha05ieHOgplN4kk9HTW+DP3E7gk28HLXYhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxcgS+ealh9dYhK3rQpwvtH5EN097E3U+fiUn8jULyTHIGQ+m9getpP6ScZjqMbz0Bb3GNxh37VBGNyDVh00KNfE9Op6RiR7tD/xqhQ15mRiH/9qXk3O7IHg7u0iFmEhzTVUZtdF+l04ZBkjiyaKtCLsNwXmPcGC2fdYcAdi88M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=d5J61x38; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="d5J61x38"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7be49f6b331so491043485a.1
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 23:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655732; x=1739260532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8Q8DUzarAwU1aGXfCPKakOOrYWe0j2UtGXEc/s+csU=;
        b=d5J61x38plFtii1ZQr17ILCQSoUkfPwsKwQT+J7qbn1Iy0/vKRKAUoFSv0Dw/MpyCv
         MErAy4i2RBDzdS/fF7wk5UdBrGM9qZYVW8DR2ydhjDsjl4/Na1kwgfLhoNM8OCqhi1oq
         mvpj2Q0l7Vet1iBC3uDDQ1klnxPJkHFnR4f0uSPf9sOg9uZvQP+jHlD9h3WGw7ZQnz/2
         UiWLaRCteQojM14CsGDd/w8z9H3o8M+sUaabxkx/DG8UfaFRVrJ+Win1YQlg4hX79QHy
         7jCPpRJvPBKXmRUvnq9ezAcCHDuSRVPqhr/glzUjnqjrkfAWNvG6ZD9uVsFdf5mGPrqd
         gqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655732; x=1739260532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8Q8DUzarAwU1aGXfCPKakOOrYWe0j2UtGXEc/s+csU=;
        b=m5n5qInQHJKLEO0KVlgJn3OCZ7Mvlkq9FTqXJuVfol2dhy2CnoyX+Us8RWYcfkTqQn
         xlhc2PXc3h3HZms7HuFs9CZzyZggLY7Chp6/vGDgQ3S+0F19Oys2ElcmuGETqSBpYG9q
         h4ibRSihmIZZ9U1/Hhxx3cDPafHb5A0qYPob8b0yRQ/+CUBGp7hqYnf/ShFRGaQYxNFk
         wQYDfJcNeb88hnpBJ+pCZBznl970a9EweJleLO6+5pHYv4ZerTPjh5W3XhavDN9iCXQp
         vJk/U4foPv9sqlFvT/3fXrE2nOOBq7HVZUj4d+q0FntyjslyGdVVq1u1OoEbHYQ51JvR
         m5ow==
X-Forwarded-Encrypted: i=1; AJvYcCUCpWzARR3WRvGzqyhCkIxlGL9zONlfMFxiNakJvhFrfmb321EIDRQv/ZZwHTJ5dLWnj5c=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQUy9aaekqCFVxVuUPXf96HfClCLUyg37Pj2wJpQqdRcg4T0TU
	I/SjYUS8BZU27YAP88hyGoQe/xKeLvYKkRoDz3qihuUAMCI1/mKGp4BCjaikIMU=
X-Gm-Gg: ASbGncsRHCoUhC5OxKwQ9OknjsXhTNQsUZxQ6gA1uSbjpKlDGSbbRRmdp6Z357+aZ5m
	mDgEY/k4Yd2ceYUPEZQnrQfRShxQisiOhVpfDlWX/m9rCn5EJnoLQZpXO4N48ONCjhdYKoCraLQ
	/e/cyjIqLU+UV3uMai5k4XDiTZqhQsBevvezVblK8l+3pMdL8gOhGnnwtFacyLYM0fmV6bb+tfi
	lqBEFSdVKExts3AiJkOXmlXyIUuVaJvGeur262D0kGIwI6LEvMdfHfMp1nGJXIxyRCoSOoApbvJ
	XpGjbDU02dTx+i13/JnkGxVY0m0e0EgUfS13epZlNeZXsEgGydsU+SA=
X-Google-Smtp-Source: AGHT+IFDcS298QZ7UQVAAQCilUqOgCz6Qta0EEYLJBdOtJFQz2jTcrmA1MOx3CQyyowlvRaOrsJYyg==
X-Received: by 2002:a05:620a:471e:b0:7b6:d8aa:7ef8 with SMTP id af79cd13be357-7bffcd8cdd2mr3753349985a.37.1738655732192;
        Mon, 03 Feb 2025 23:55:32 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:30 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 07/10] irqchip/riscv-imsic: Separate next and previous pointers in IMSIC vector
Date: Tue,  4 Feb 2025 13:24:02 +0530
Message-ID: <20250204075405.824721-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, there is only one "move" pointer in the struct imsic_vector
so during vector movement the old vector points to the new vector and
new vector points to itself.

To support force cleanup of old vector, add separate "move_next" and
"move_prev" pointers in the struct imsic_vector where during vector
movement the "move_next" pointer of the old vector points to the
new vector and the "move_prev" pointer of the new vector points to
the old vector. Both "move_next" pointers are cleared separately
by __imsic_local_sync() on the old and new CPUs respectively.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 77 +++++++++++++++++++------
 drivers/irqchip/irq-riscv-imsic-state.h |  5 +-
 2 files changed, 63 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index a8645084bd8f..649012cc47a8 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -124,10 +124,11 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 	}
 }
 
-static void __imsic_local_sync(struct imsic_local_priv *lpriv)
+static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
 	struct imsic_local_config *tlocal, *mlocal;
 	struct imsic_vector *vec, *tvec, *mvec;
+	bool ret = true;
 	int i;
 
 	lockdep_assert_held(&lpriv->lock);
@@ -142,15 +143,33 @@ static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 		else
 			__imsic_id_clear_enable(vec->local_id);
 
+		/*
+		 * If the ID was being moved from an existing ID on some
+		 * other CPU then we clear the pervious vector pointer
+		 * only after the movement is complete.
+		 */
+		mvec = READ_ONCE(vec->move_prev);
+		if (mvec) {
+			/*
+			 * If the old IMSIC vector has not been updated then
+			 * try again in the next sync-up call.
+			 */
+			if (READ_ONCE(mvec->move_next)) {
+				ret = false;
+				continue;
+			}
+
+			WRITE_ONCE(vec->move_prev, NULL);
+		}
+
 		/*
 		 * If the ID was being moved to a new ID on some other CPU
 		 * then we can get a MSI during the movement so check the
 		 * ID pending bit and re-trigger the new ID on other CPU
 		 * using MMIO write.
 		 */
-		mvec = READ_ONCE(vec->move);
-		WRITE_ONCE(vec->move, NULL);
-		if (mvec && mvec != vec) {
+		mvec = READ_ONCE(vec->move_next);
+		if (mvec) {
 			/*
 			 * Device having non-atomic MSI update might see an
 			 * intermediate state so check both old ID and new ID
@@ -177,22 +196,44 @@ static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
 			}
 
+			WRITE_ONCE(vec->move_next, NULL);
 			imsic_vector_free(vec);
 		}
 
 		bitmap_clear(lpriv->dirty_bitmap, vec->local_id, 1);
 	}
+
+	return ret;
 }
 
+#ifdef CONFIG_SMP
+static void __imsic_local_timer_start(struct imsic_local_priv *lpriv)
+{
+	lockdep_assert_held(&lpriv->lock);
+
+	if (!timer_pending(&lpriv->timer)) {
+		lpriv->timer.expires = jiffies + 1;
+		add_timer_on(&lpriv->timer, smp_processor_id());
+	}
+}
+#else
+static inline void __imsic_local_timer_start(struct imsic_local_priv *lpriv)
+{
+}
+#endif
+
 void imsic_local_sync_all(bool force_all)
 {
 	struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&lpriv->lock, flags);
+
 	if (force_all)
 		bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
-	__imsic_local_sync(lpriv);
+	if (!__imsic_local_sync(lpriv))
+		__imsic_local_timer_start(lpriv);
+
 	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
 }
 
@@ -232,14 +273,11 @@ static void __imsic_remote_sync(struct imsic_local_priv *lpriv, unsigned int cpu
 	 */
 	if (cpu_online(cpu)) {
 		if (cpu == smp_processor_id()) {
-			__imsic_local_sync(lpriv);
-			return;
+			if (__imsic_local_sync(lpriv))
+				return;
 		}
 
-		if (!timer_pending(&lpriv->timer)) {
-			lpriv->timer.expires = jiffies + 1;
-			add_timer_on(&lpriv->timer, cpu);
-		}
+		__imsic_local_timer_start(lpriv);
 	}
 }
 #else
@@ -294,8 +332,9 @@ void imsic_vector_unmask(struct imsic_vector *vec)
 	raw_spin_unlock(&lpriv->lock);
 }
 
-static bool imsic_vector_move_update(struct imsic_local_priv *lpriv, struct imsic_vector *vec,
-				     bool new_enable, struct imsic_vector *new_move)
+static bool imsic_vector_move_update(struct imsic_local_priv *lpriv,
+				     struct imsic_vector *vec, bool is_old_vec,
+				     bool new_enable, struct imsic_vector *move_vec)
 {
 	unsigned long flags;
 	bool enabled;
@@ -305,7 +344,10 @@ static bool imsic_vector_move_update(struct imsic_local_priv *lpriv, struct imsi
 	/* Update enable and move details */
 	enabled = READ_ONCE(vec->enable);
 	WRITE_ONCE(vec->enable, new_enable);
-	WRITE_ONCE(vec->move, new_move);
+	if (is_old_vec)
+		WRITE_ONCE(vec->move_next, move_vec);
+	else
+		WRITE_ONCE(vec->move_prev, move_vec);
 
 	/* Mark the vector as dirty and synchronize */
 	bitmap_set(lpriv->dirty_bitmap, vec->local_id, 1);
@@ -338,8 +380,8 @@ void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_ve
 	 * interrupt on the old vector while device was being moved
 	 * to the new vector.
 	 */
-	enabled = imsic_vector_move_update(old_lpriv, old_vec, false, new_vec);
-	imsic_vector_move_update(new_lpriv, new_vec, enabled, new_vec);
+	enabled = imsic_vector_move_update(old_lpriv, old_vec, true, false, new_vec);
+	imsic_vector_move_update(new_lpriv, new_vec, false, enabled, old_vec);
 }
 
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
@@ -402,7 +444,8 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 	vec = &lpriv->vectors[local_id];
 	vec->hwirq = hwirq;
 	vec->enable = false;
-	vec->move = NULL;
+	vec->move_next = NULL;
+	vec->move_prev = NULL;
 
 	return vec;
 }
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 8fae6c99b019..f02842b84ed5 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -23,7 +23,8 @@ struct imsic_vector {
 	unsigned int				hwirq;
 	/* Details accessed using local lock held */
 	bool					enable;
-	struct imsic_vector			*move;
+	struct imsic_vector			*move_next;
+	struct imsic_vector			*move_prev;
 };
 
 struct imsic_local_priv {
@@ -87,7 +88,7 @@ static inline bool imsic_vector_isenabled(struct imsic_vector *vec)
 
 static inline struct imsic_vector *imsic_vector_get_move(struct imsic_vector *vec)
 {
-	return READ_ONCE(vec->move);
+	return READ_ONCE(vec->move_prev);
 }
 
 void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_vec);
-- 
2.43.0

