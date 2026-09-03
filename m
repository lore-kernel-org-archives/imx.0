Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D9142EEC9
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 08:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423622; cv=none; b=LGEi4bYiaJ3cVLd6PXhLC1BGGQ9V0sgCTRwb5R5taT2yHsG819VHRt/pWZSmAu7vrERe6oCYe07PvHy5rsQt4iKH4ftQn04PPoEVdyuusp2pTA1HdNQNogjLD3KCwQXR8IfZIJ1f4w+ScndgqKvfmWs6MntZwdmj4AsbdNLtCGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423622; c=relaxed/simple;
	bh=tvdtMyEtOu1RNXfZKxxmwK+g7oU0uFtfK6RL75o67vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tcQwPEB9a3y1B+srztN1D/T3fzcrpjujP4BdCJ0YkpNS3XEIxfCLEV0rCVoxthuWereGypSVXNeufebYBjGrk7QyPrHQv3wTs870h3EMnCOtfX2/elKBIZWKD+1D4xpQ0U1yDQXZihH5Rtkv3oU42c1oB7PD/TyextfctpKCj+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjr8zY7Z; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjr8zY7Z"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso23886605ad.3
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 01:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788423617; x=1789028417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1U812yxaafxSGhCI1gFsBnn4eRLRGSwsqnn6M2QiaRI=;
        b=bjr8zY7ZRY3UWsI7EwLcParlwKnjh+M5mrsZ/+A1/Qv34aQd3ebbXwiE0KWcybY7D9
         jub1bBAG2sKultrYf0hkul5/8589Jw4/48mS/ZKFMwPWtS3ftu2Rz4/fmFGnvHSWdE/j
         dsf2VMehfAk5w5StjXIXzLbdmYxXX7Y0K+ncs4YrtTF+YU7ioYwk+z7PiVOI5E0NloQD
         vyKUNA8DWWZsRQ0GaRe6lSLK7JePBQS4AsfmtQprxz7WJ4EQlU1f/c8uvw9jaVKkIX1H
         +ZjJihp+q2UmWYAwTqaUpdLBFDg/LwiQdB8Iou5SstVyfwUhGpttysu466rfLIIWSquD
         ZLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423617; x=1789028417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1U812yxaafxSGhCI1gFsBnn4eRLRGSwsqnn6M2QiaRI=;
        b=D558B2bpy0bL+SJojLMx7FKbfdD3QXxCsKHqumKufVFJSZ46YgvMeROFiDkFzJ7szs
         sA/fmWQ0J1a1JwV9B+1RXZXqkl2S24qM2IpcAFZ61Udw5PANQHpJxBaL6iiydHthmyU+
         Mz/gjOIq5E9OnrCFCZ12xSRQ0jumghHfgKBtoCWK5Rp0ZWX5Qu+Ct1PKj1aHVjuX5G5O
         TjCZ9KeXvYktUZM0yt15xLT+rWJFkI25WSUWCy2oSwLK7zTDLebeiUYapv0vR/YEQw/R
         ZC52Ul8SO1iSIwtT5hyHcUoIQu5oubpjbGEJaxXSOga5uR5Zi+AZcMp6ztIMt/4ufpyx
         Qg7w==
X-Forwarded-Encrypted: i=1; AKwUvBzPaXKmVfgJsBl24Vc6lw5KntjTJKQOkWsHqp7a3Fr5QgkjPEskpiJMqysajhPRQmCeeyM=@lists.linux.dev
X-Gm-Message-State: AFuF++nK4XZ8zOjqna0QPy97V3xODSOMcDpZc3fYZtIfBCq+OKZHk207
	yETMPxHxEDdk5Pt+/vaTdZSmcwVF7E0FwVChdQ1HQ72i3/AWXHvbUyA=
X-Gm-Gg: AYBFou2jP0N1jBOQUGtRZuzOwjDq97NWl9Osw5TkvIn0BAkqNVqwcnctLmJwZUrZi0J
	f33ACk067MxhnAqyOOIgALniGy6Ne6yhklGuAcrTNLXY1uc8Ca88mwSZ2LnlMJOgJew+kq/dtmj
	xQQblaWB+gzv7y9q3/SF5WoXLfIyg8aKlTerjb7wsomFBqb+9mwZj5CYjmQvyVjsz230MlZFaUN
	QCm3c9X0FHSDHIjwXNohccHMLk9vYpZwRQ6/utCjIoHJLdhOJZMkS03MASf38uYHxLmWyKSI2tO
	MweFD4+MDlFIMmh7QXwVzneANql37OeMGweTFu3qyV1yfUdl7udNFiR9gj8ZA2B9kK7zoV1z18z
	lVth9nACabLTvLvITcYTBRbmMF+bnnbtOZ69ofuMGrTXvX9kU+VCQuCDN8X2KG54oyhXKDBUmN+
	xK6/aXvTMQFFQj0zqrCg90P36t4wVWHTJ8npgg4rRO2p2eVOCDISkzr3hHyJ4IqDnA1TxvR6fQH
	YbfblXprjeHQbDn
X-Received: by 2002:a17:903:388e:b0:2d8:df44:a5c2 with SMTP id d9443c01a7336-2daec78383cmr140649095ad.20.1788423616934;
        Thu, 03 Sep 2026 01:20:16 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6496:3266:b22d:ab57:a1be:ef30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe92ae86sm6602045ad.40.2026.09.03.01.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:20:16 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Samuel Kayode <samkay014@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: pf1550: fix division by zero in the ramp rate selection
Date: Thu,  3 Sep 2026 17:20:09 +0900
Message-ID: <20260903082010.4024603-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_machine_constraints() calls the set_ramp_delay() op when either
constraints->ramp_delay or constraints->ramp_disable is set. The
regulator binding documents regulator-ramp-delay = <0> as the way to
disable ramp control, and of_get_regulation_constraints() turns that
into ramp_disable = true while leaving ramp_delay at 0, so the op is
called with a ramp_delay of 0. The range check rejects negative values
and values above 6250 but not zero, and the value is then used as a
divisor.

The mapping is also wrong for the values that do pass the check. The
hardware offers two rates, 6250 uV/us and 3125 uV/us, selected by
SWx_DVSSPEED in SWx_CTRL1. Dividing 6250 by the requested rate and
taking bit 1 of the quotient does not map monotonically onto them: a
request for 1500 uV/us selects 6250 uV/us, while a request for the
faster 2000 uV/us selects 3125 uV/us.

Replace the division with a direct mapping onto the two supported
rates. Requests at or below 3125 uV/us get the slower rate and anything
above it gets the faster one. A ramp_delay of 0 asks for ramp control
to be disabled, which this hardware cannot do, so it gets the fastest
rate; pfuze100 handles the disabled case the same way.

Fixes: 7320d41c29bb ("regulator: pf1550: Add support for regulator")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Compile-tested only, I do not have PF1550 hardware. The register
semantics were checked against the PF1550 data sheet rev 3.0, table 28
(SWx DVS setting selection) and the SW1_CTRL1 register description.

 drivers/regulator/pf1550-regulator.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/pf1550-regulator.c b/drivers/regulator/pf1550-regulator.c
index 610eac9bb9cb..5394bc784e1d 100644
--- a/drivers/regulator/pf1550-regulator.c
+++ b/drivers/regulator/pf1550-regulator.c
@@ -49,17 +49,26 @@ static const int pf1550_ldo13_volts[] = {
 static int pf1550_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 {
 	int id = rdev_get_id(rdev);
-	unsigned int ramp_bits = 0;
+	unsigned int ramp_bits;
 	int ret;
 
 	if (id > PF1550_VREFDDR)
 		return -EACCES;
 
-	if (ramp_delay < 0 || ramp_delay > 6250)
+	switch (ramp_delay) {
+	case 0:
+		/* Ramp control is disabled, so use the fastest rate. */
+		ramp_bits = 0;
+		break;
+	case 1 ... 3125:
+		ramp_bits = 1;
+		break;
+	case 3126 ... 6250:
+		ramp_bits = 0;
+		break;
+	default:
 		return -EINVAL;
-
-	ramp_delay = 6250 / ramp_delay;
-	ramp_bits = ramp_delay >> 1;
+	}
 
 	ret = regmap_update_bits(rdev->regmap, rdev->desc->vsel_reg + 4, 0x10,
 				 ramp_bits << 4);
-- 
2.53.0

