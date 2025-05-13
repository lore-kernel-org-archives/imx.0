Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08EADF49
	for <imx@lists.linux.dev>; Tue, 13 May 2025 06:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118197; cv=none; b=Ck+D/2OuVn7nwMNXDX1LqC5aAbHpyjbKOnsjPA9sAZUnw2XucHSTZgep9fgwkzkOvfb+9mZDmRcgWvCWbBt9Nu6xLbjK2K8/rwdtPDpuan2dvjNl2orS4FdlZUG8hqFfpvdwGd/6//8RQItly01aNNxBmXboKb0ASLKDDua7gMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118197; c=relaxed/simple;
	bh=Zc6yQyorlVRgdIL0rSi1mnvWlZcO61DoFG74OAaARg4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rBi7haNUHseJLcBpY9doofVZ2gzKG7CIm74xPjx6n4Fqjig4JgSdE1ysauZdaVJbVIFZq1kJNhdn05VvUTIpTzW+eUoMRBM4xfmpF3I2THkLGWU+XZ2bknkhZ2aI3j3tvFm8TL4ylX5V3JVuIf/ek+RLS2mTMU90LrFsfKIksW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRifOF0o; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRifOF0o"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so5587644b3a.0
        for <imx@lists.linux.dev>; Mon, 12 May 2025 23:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118195; x=1747722995; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JAfYIBnKYpDLRaIrWgcSn8A7MH7EEr05jrz93Ajb9cs=;
        b=XRifOF0oEtmeUcYb9JyP5Hyr0Fd6kfcRHdVac0xNZV/8rmVwdIFas/6Zm9o0z41/Hq
         dCQNQS50z5lrMMHAwU56OXfM2hbpFE20zIpWaSYamzxfVBbY3uedZDYkNC9yj/5b3INv
         cm2rDmJAQ+R87usjAaSDIuERI7zYdI6IcnY9Ajts6dCmLn4PGiCi21wxU5E6Ysd4uHYq
         A9/cy4xaByl4WJF7S9FGVIPfL+psFZo2A9ReEsdu7OsYWhDJm7+xAjHfSMhIhIndeB5h
         q91IpiQgcNp+aMG0xBIsYZMKEShhZngoMkGr4CgKtSnVdR3FwA8TMS5rMA8O+0tV6Qcx
         2q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118195; x=1747722995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAfYIBnKYpDLRaIrWgcSn8A7MH7EEr05jrz93Ajb9cs=;
        b=OMNjK+OpRx2vi8XfG26qXCb8Ffcu03YHrXGGDw2Z2zcfhIMRlWePuBpRTgdUWh8Rnx
         Oaj6YSRlVkX1RyGIZJJ3vcoeBzF4j/f2752ghiGraQ+ekJJmf+FBzL070bCXK3zfJZW+
         S1vgyVbbLKxwUBhd5hCfN98OyL50Y4GywJzIU5VBcW2oGu8g5nDkjg2cIVmu0ntWxh7d
         wZU5OLHWnHXuzPs5i186QBDr5hVHfbHvbNKM/3eKgYd14Li6XAW3qK8kgEz2kJaDfnt8
         NqdGHmeMM2ntMrwW+1jDILBQAliSobw2rbicqpFcbHP+nA0LoAT93DdF4hVvKVI4YGb2
         lnNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTj/AioF7XmFjjIFJp1V7fCyvWIUveTOOFMK6F6ChHVPeeUTRAaqIEUr03YwOhMazgnZE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx50JEAQKw2fhqplWzfBbAVrJyBEz2nw0Ody9c1/69Lz1pmI+m2
	vNiY8wrro+wYGl9o/igc1NgslcsOwpgJi4T7E5PcbW+y0JxjkLuk
X-Gm-Gg: ASbGncuioAd/xIGt73p2L9HQa3DO+qbd/qvg91eOYHpc1Mek54+FJ/DLE3k0j5Jbnw4
	SoaOW5ZZudAX7vf6xCdU/FPNuR5sbNjCE5t6Ghb0jl5FzXQ96VyvZ/S53GCvcGc3yRhS9ROBWO5
	YswwIAlnMzI27+MtPpMHb+BMUCYH50QRAu70DSIvh/0XEkyOIX3JfxYAG0ev/XidVLV+IMuw5z1
	U+ngHdaYOmdizOLIUPHhpIvrh+vOmOj5sQhUxYoOwuCg/580+lfzK0Z10QfH4N+q5NOiePPEPsm
	myHsXqa5374sVvvgo8doRzwgylxtp1x4s0mBcRpnaKd7F/JrM0LptR8D1//yI0xPIA==
X-Google-Smtp-Source: AGHT+IHAzcJWPedcZbhkiu5M1cagox2tF+zXlSND/8z+TRNJWT8nZ3aHFKNr8Qq+zyYM82VNJEGSQg==
X-Received: by 2002:a05:6a21:150a:b0:1ee:5fae:8f6a with SMTP id adf61e73a8af0-215eb6dbd7cmr3827294637.1.1747118194892;
        Mon, 12 May 2025 23:36:34 -0700 (PDT)
Received: from [127.0.1.1] ([91.124.30.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234a0b76ccsm6657936a12.27.2025.05.12.23.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:36:34 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH v3 0/2] i2c: imx: guard and drop prefix
Date: Tue, 13 May 2025 14:36:12 +0800
Message-Id: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3oImgC/3XMyw6CMBCF4VchXVvDtJSiK9/DuEBmgEnkkhYbD
 OHdLaxIjMtzku9fhCfH5MU1WYSjwJ6HPg59SkTVln1DkjFuoVJl0kyBZFVJ7mb5HrGcSCIA5jl
 iYakQEY2Oap734P0Rd8t+Gtxn7wfY3r+pADKVANrWUGuj0dyaruTXuRo6saWCOnL7w1XkqEGRv
 mRPY/WRr+v6BbXPuUnrAAAA
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747118187; l=1186;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=Zc6yQyorlVRgdIL0rSi1mnvWlZcO61DoFG74OAaARg4=;
 b=q9clC7BV7yQN12t9Wb9qmMCulgBg+RP8VyfC4iP7GyDFUeDvCVNVajzQDZyDIgsMVxU8yBsdq
 blP52SIuTgBCGH3U2by9e+djgC2nV65clel6gFiWKkG+k/Bnec9xulx
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Since this patch[1], we have new callback function names.
Since this patch[2], we can use `guard` to call `spin_lock_irqsave`
and release this lock when it goes out of scope.

Link:
https://lore.kernel.org/all/20240706112116.24543-2-wsa+renesas@sang-engineering.com/ [1]
https://lore.kernel.org/all/20250227221924.265259-10-lyude@redhat.com/ [2]

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
Changes in v3:
- use scoped_guard
- Link to v2: https://lore.kernel.org/r/20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com

Changes in v2:
- Add more details in the commit message
- Drop a useless variable
- Refactor the logic of i2c_imx_isr function
- Link to v1: https://lore.kernel.org/r/20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com

---
Troy Mitchell (2):
      i2c: imx: use guard to take spinlock
      i2c: imx: drop master prefix

 drivers/i2c/busses/i2c-imx.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-i2c-imx-update-d11d66dd87e8

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>

