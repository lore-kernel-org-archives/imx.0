Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C943822BC
	for <imx@lists.linux.dev>; Fri,  1 May 2026 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629451; cv=none; b=oOsb1KR1E9RECkhKYznTmisyF9N7j/S/jsiBD67Xa0/Dfrde7dSHESf7ZS7rgXnA/wlpSgNgCxdRByc7NllgYAavy3rLIkFa23HJ8DzseR/wg3LeOZLtR09WcXuRWwjrKXCKB8a/ZnEEY9os01PwZ4p3hpfsevcGvC3VFUe8RAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629451; c=relaxed/simple;
	bh=2DUEGmGBfiPDJoF4glzsd2tFfRCHmiYNGIfP0DCGq+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdQeEX0bI8In//Fe8olh/NICcb2nb/J211gm1tFf/m3GWq88BvQbb0LUz1vN+lVi+LJnX1HfExALGyAGR2TIHcZVP28aS8jfsT1pQWS/VS3Ly63BtlAguut58tVYcupCU7ccofv0N+neJquc7ByHFwRyvs+vGybdTDVRRBgKsXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmF3udJK; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmF3udJK"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c79662bbd2eso1062775a12.3
        for <imx@lists.linux.dev>; Fri, 01 May 2026 02:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629446; x=1778234246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtSAsL8S4A9Pm+EutLuBtDes8X3zjz/YG0VQuIH4tno=;
        b=HmF3udJKdapicf59eUDwZgksFPDOX9lufCsdgY8z3ekTtEWQJuqzFxZUtGuCQBwu0c
         zNfaY27v1PouAmtvygmq4VfpB4pkCHsjCzHRwJNscN9nyk5UYg1NET2DKTSjVQmxFcE0
         kpg8Qsb8JCicbBWGlBRnwTnc0RrEE/AH1YwjpBFdWeyY7/tmHPmEdOcobgazXQcuyhw1
         TuBoGliFKU0Ul3mOOCC4mGgz+B1kfEeoVxxwDGAHpxGZfAfTyQCALTyFhOGR23qJpJY9
         Gy0PjrRa68GtJsDvv/8sml6GCEJGRQEQsGMvHFmfzP7NU2HVdC+GCzdklmv0awet3IAF
         y6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629446; x=1778234246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JtSAsL8S4A9Pm+EutLuBtDes8X3zjz/YG0VQuIH4tno=;
        b=XXuolbsBz1T7atqRYxjvNlrWOZz+Xmv5A+HsStneIi/VPARoXRZo4SVZEiEKWhYVkp
         /LbjtJxNTK6SG2nJJAKULLNgHKScueCGYjr/zejE9mP3fRbqz3VwJoomb/dEtpdRMM7A
         mxnoG7XsvUHJyyzSK9hDulFOspnn44NHAwqPGq7Y1g9r42CurcKrHGLGSgoPXX4YllYp
         z1TPKzlrSDeIJ4pmCdJW4voPBOdOJyQO8a1KQCeLWhaWdyqFaTZuXP2oeC7Cs0UzWNTZ
         cDSmoCdXcCnMMBj+byiqAFrughDGN6jJ05LeVXbwWTo7y434/EFHrwrRJjGfRG6/grrI
         xfXw==
X-Forwarded-Encrypted: i=1; AFNElJ8SmBSviQ1Z94ZQExI3lTFlWNZSnSzNId18owYbm3ck82s6NbLjNc5LSO8Bcd8Imt+zwgg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCgRY+dnOPDtlYfu3dh/kNCufkFld4qqXutjiQmK62ZtFCOgEC
	REPLsWLSa4Oo5LBkuQOtZ5Of5oMMZnnfCI6womg8P50p47nHW2xCz6HR
X-Gm-Gg: AeBDietGL5Pr+kJ/4SxK3qWd46I+WRWjxW0jtcoU/ZsCgp3IBXrLuaIUplNb6A7mfq3
	bqBmX3ujdgggcEbMwX8sG+KibuPKohDQxhS2rqakg5oi0INWk/Kb4B5QQNZ4r6MBNiSPOkOVzjT
	pqdxM0JUsZJuf/TMM4qNrH56ltlY5br0QxaS6ZlzNUeeGCYLFMA03YlPFS4z8J4ZGOxP7jIjNPf
	I5otEvklmAFIO4ahkxZ1LwgX33XrDLY6xCFyZFxHBsf0YVaQXpAt/2zaW/H3QRS4icTEVBViPnf
	cmJtD2rCiOKktiVuxbKQ0gv2UoQc/f5854e/Oy/koJgYpM1h5yR51NyrAv+SbVUyyQjhI85ImHJ
	SbshJ0tVDp1Lo/oyuEaUU+2yahS1j5Xef6i2MIHGCYmATF+9OI6fPTE+CtzTezZpjqrD0jKO/jP
	hhWJDtY44jak1lUA==
X-Received: by 2002:a05:6a20:3ca3:b0:3a3:a177:11f2 with SMTP id adf61e73a8af0-3a3cf8f73bbmr8146741637.56.1777629445727;
        Fri, 01 May 2026 02:57:25 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:25 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 1/4] media: hi846: fix hi846_write_reg_16 handling
Date: Fri,  1 May 2026 17:54:30 +0800
Message-ID: <20260501095433.1609309-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501095433.1609309-1-mitltlatltl@gmail.com>
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
remove `else` in v2
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.54.0

