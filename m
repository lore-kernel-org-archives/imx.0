Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8EE2EC56E
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 03:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761706802; cv=none; b=YI0HG6mgb0vj8OATGosc8quZLAWJRUa6SRL654w7Bk0Nra/JlkmwKsxglRRWboJUdCk7ZThqd78cW6mhtU0CTsfoXuWyooY7gOUbF+gJQ6H4yfdBHOIWMZoBVx0wR56rPSPbJkwryi8mr7vZSc2/p3NRukC6T3n5qQ1/t/rrwsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761706802; c=relaxed/simple;
	bh=uvWxTYSvYRprQ1ZW3Euflh2mgClxsjMln7S5s7l2A4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tvFLNIsTo3oRnfRHUj7VFiZ48WuYZlcWZNPtz2T1zvr3Fso+k6GJUeSfYp+7cCpMKrpHHi6OP5/iABlEZJasxFVQO/JLMVA2lDz/W0DISjnWLED4DSr2qQU3adY7ql5Y+op05I4GMRcI8yxjogtpP/D4e5nZTZfPQXt8JZwuEvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYqpg+/X; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYqpg+/X"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4eb9fa69fb8so55423981cf.1
        for <imx@lists.linux.dev>; Tue, 28 Oct 2025 20:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761706799; x=1762311599; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ikVE0ssZ8PILuEq4k6Un4Yxlye8b1lZqi+jy3bbKHWs=;
        b=eYqpg+/XNQ2Y+to2qygIDUNVfDtPNEZSeKoKCZAlFX1i5dR9kUndX6OqeNrugESd5+
         rwMq6bA52W5xYYpRa8VcbrBeZVHvbh13oi5OskoAf/SC0OdW3XlutryK1uKsKZKXWXCf
         GgC8JJEb5b/vdmHYN8fl9cRoaTZ7mahx7e19ggv6Q/fNVggJ1CW3orDTMGWPol/W62lT
         js5+oDA4/p49H0zHpmyyDJGTH0tXKTCVE3PATCursHAqbxhkLrH1LFWiVh2rBld8fS9x
         m9u/NivaEz7mRfHsPnZRFrVH6PE58yrfJI9GPi8cG6CI6ELaiAbYAXfoaQ08ZYU4QWcb
         KljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761706799; x=1762311599;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikVE0ssZ8PILuEq4k6Un4Yxlye8b1lZqi+jy3bbKHWs=;
        b=I+Gmp9iAjv+JhaFEF8GPLxIrM2ukakxvtm5tUOTEb7CDXoF6mzj/dJ5kPJ0TkzZV+9
         etKSU822Eeqm7mZx+GQHXQWXLrHxRzu2wzMjU28fTYwCRPKXzz0xEiMH75oUaEEHXgRT
         mZrw6Fc3g73GfMc3G83fgoVmZXD3ppK/9MQMesMTYdWfY1tDo3f6013tlhoUuOVju8+I
         CTKWj44H4U8fgqqwV/Yvrl91cI9ChrfSDPbC7kzu/cD9s8TutmbMzT10p/3RaYXW56mi
         6kvJ6xAMR/UAYCojAcavEj7FifCQLM3tyFee42X79+l/unKALi6KDBfT55ZftFwlsw/F
         PS0w==
X-Forwarded-Encrypted: i=1; AJvYcCW9NubYgx9odqJKoxcmekBQNxj9o1QbOzhlhnid7J0W3LBvODfe4zHUd53yocBdLB2E62s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnw/PCAM1JYyBlYMmHJpuy4Ln3m0D66lzl5Inj7qKcQPgWu4bL
	kCVO0qAfxHp4VFLoC1kI2ric+CbC8v8DI3Vw9am88uQlIss0KGeF/GG3qmhTGR+9
X-Gm-Gg: ASbGncsO7xwL+hDtP3wCI9sbVdImTSdMQmqMCbqpf9Vsc5D9vInMUhtB9NzD5v4M/gM
	Kz4OY4COZMwPcMi76GkxpBKoUQeUcUXDQIE9FjZMtau1mUhR0fKvh5qDaw2CFnjtEBAP3NODH3C
	6je926J6JDLnSHWvf5lhpyKGSOfFrENRHY7wFXuOIa9q65VnvDOuJXRJYQBHjbQySinBICEJrE3
	UZCNTCkZ3psrAkMBVlNs8d10/u3mzty9XdLH772xUpWaAH93ZH+4Wi4sQ16P5Gs0yCs/Vl8b2LL
	WxzfPYDfosVN+IoI9tBxuG0GWHh3OOWPhy59KpSpx/Hx1nuEEZnehjpbaVpmCMzXqKov0idRDwy
	lcVMy70j8cDjpqt7Zng9eMgL7eWQHqnZw3WnCpf+8NbBK2MhXWM8eP7Uc7AmELSRbk9EheXlSjT
	+n8fLVXNY=
X-Google-Smtp-Source: AGHT+IEvOug73vtl4ROvl4ozZsUcProXlbhk8qKycNCnxdG+O+1krran8kKir/F0sNEdEd48ksbtCQ==
X-Received: by 2002:a05:622a:4089:b0:4d3:3ecd:efd0 with SMTP id d75a77b69052e-4ed15b32dafmr19732431cf.6.1761706799473;
        Tue, 28 Oct 2025 19:59:59 -0700 (PDT)
Received: from [192.168.90.162] ([142.182.130.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc49783eesm91505776d6.44.2025.10.28.19.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:59:58 -0700 (PDT)
From: Samuel Kayode <samkay014@gmail.com>
Date: Tue, 28 Oct 2025 22:59:35 -0400
Subject: [PATCH] input: pf1550: Replace deprecated PM_OPS define
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-pf1550-v1-1-c50fae56b9b1@gmail.com>
X-B4-Tracking: v=1; b=H4sIABaDAWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyML3YI0Q1NTA11zw+TURGPTRINkSwMloOKCotS0zAqwQdGxtbUAZM+
 jM1gAAAA=
X-Change-ID: 20251028-pf1550-71cea35a0c90
To: Jerome Oufella <jerome.oufella@savoirfairelinux.com>, 
 naresh.kamboju@linaro.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
 lee@kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Sean Nyekjaer <sean@geanix.com>, 
 Heiko Carstens <hca@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Samuel Kayode <samkay014@gmail.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761706797; l=1053;
 i=samkay014@gmail.com; s=20251028; h=from:subject:message-id;
 bh=uvWxTYSvYRprQ1ZW3Euflh2mgClxsjMln7S5s7l2A4k=;
 b=4fOl76a+CJsXMrMz+3jonDtJ6NY+vU6ExNNoQfFuEd/1lba8UY1jfJ+UsD9eN1tHk4G1uPX5R
 14VlvMCGU0DDnq7Zctg0xOZZ6d15Bc2fsqI4Bw14sECTQ5Ysid+PEw+
X-Developer-Key: i=samkay014@gmail.com; a=ed25519;
 pk=favoK08ilD1j62PrGf+RHihBzbqJGWMC6f2nszR5UIc=

Replace SIMPLE_DEV_PM_OPS with DEFINE_SIMPLE_DEV_PM_OPS as the former is
deprecated.

Signed-off-by: Samuel Kayode <samkay014@gmail.com>
---
 drivers/input/misc/pf1550-onkey.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/pf1550-onkey.c b/drivers/input/misc/pf1550-onkey.c
index 9be6377151cb3be824ab34ff37f983196b909324..a636ceedfc04f0946e002a0b1be4586138429f12 100644
--- a/drivers/input/misc/pf1550-onkey.c
+++ b/drivers/input/misc/pf1550-onkey.c
@@ -173,8 +173,8 @@ static int pf1550_onkey_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
-			 pf1550_onkey_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
+				pf1550_onkey_resume);
 
 static const struct platform_device_id pf1550_onkey_id[] = {
 	{ "pf1550-onkey", },

---
base-commit: a7d6255a0bf302c028ac680564633a6aac5f611d
change-id: 20251028-pf1550-71cea35a0c90

Best regards,
-- 
Samuel Kayode <samkay014@gmail.com>

