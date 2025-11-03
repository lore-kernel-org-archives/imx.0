Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4644BEACD
	for <imx@lists.linux.dev>; Mon,  3 Nov 2025 03:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762139960; cv=none; b=ARhhDSjGg3WGsc9sZHyJFLJOKvGa7pdGpY1u6IAEQEzuGlpFL7dL4bTPq2qFwPgNIKXp+SMSFsZ4Y1Wn06rVCO6/mvONMoELILoJ+4KPv4AaODk/JCIQA3iCbZZQRdeVUtSTUJ/bN+oFGYenCAmLQjeH41bgRXZQWkEmcXaoaiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762139960; c=relaxed/simple;
	bh=ziBDk35TYk7YiW6K7GPffNVDP98Fs1iA4htR5FdmfDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LxBSffZi7TNh3P1H710XlC/ZJq20bx9DpKjW0oLLfaZwGf5EH3aCP7qmbIdRoGNZU7go18t+qwYmXFYxXCmw+P/ykmAUeNlFFG0IrANxo+ZP6/7na9bcCwKDwL3bRp+an3eNpT39YOTx0Lx3SdhcfCoHC7g6T2C6L/Dym8rj67w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSIubuUi; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSIubuUi"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-89f07fee490so544414685a.0
        for <imx@lists.linux.dev>; Sun, 02 Nov 2025 19:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762139958; x=1762744758; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QiKTLSU3N8p12FQc+H8NuC8MRpkLZYq4zZdU+gN4fiI=;
        b=dSIubuUiQRXYY3CuJbtcHiP/6DyG30bj7MtycHDFiV7jmfBERxUfOH+D3FK/oZH+3g
         XuBhUbwPcexmOC8i8rY7SUVWBb7oJT7aYOFmM1YHi96HqHy5JolCM91zJ+49T1UDJka8
         9nyp9VIRarpMoVvN/7ZOId6wAhhRr7PvOzr0jUvbt2OJ7ML9wOBJ/d12uC2bA8Xl8Q/6
         gUvY3ReViHDBKQIrLcN6exMnDmBCKuMholpFQaTpQQRKrsSoweeLVGfIK+3KJroroz/f
         ULh4brfORWNu6fMiK6aSJO/Gt5ot1NwuQ/duWtbasnZ1RlWlOEwuKPEaPYgs3XQ4GpKb
         lGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762139958; x=1762744758;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiKTLSU3N8p12FQc+H8NuC8MRpkLZYq4zZdU+gN4fiI=;
        b=C4ReF6SIYHZBHbQsMYw2OABl3t79Pm0/hFQNKB1QxW0LNjPeSTZWq3c8P/MrKlJZaM
         PUQ+IklvPuSpyA7oyIYgQlsBgOUQ4imLWciCzCljTXNT/CDzkBGuWA50E9oRNzYuhHKZ
         6xrq6XrxN6UR04emZHjqeB2zxi7JrTI2tFKILH5Wf7iUXRgrtHwFd2xekHx2KUVETHBM
         k4+QCAgWyQDFRAk8JPkVBSBd61RXgyWG3pwy9fre2PJdiInPnjO73RUdGORuJxB+5uBz
         n3YTGmd5Jyz4ARGSuRJk/7e7QnE83R3H5Wobw4sTH+6yWByQ4eGFPnPUsjRr3u/jlVXf
         tqaA==
X-Forwarded-Encrypted: i=1; AJvYcCVSnamILMXeiU3T0DbxkdsKRYCubtBLH829KTt53Xov3A2FcZTpqoS4BMfIuB3HW3lTdd0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXi9GM4NpGHOB046SYz6Tf+VzyD44jXZUZ1Nx8t3KMarPP2AZf
	LBtzWj099IF0qcWHtEcFzC4bJvRlWarpKu9DhtjQeNvzMdkuo3YWfjF5
X-Gm-Gg: ASbGncumLhdl/il+qiWDX/pgNG5YBh4c10D6gFJTgsHWwP89iilDjRJOxeoxEF8fxQ6
	2u93U6eZ9Hv6D0dijwObv35YyNujIvLSrRYhROCm9smCoB037lY2Ehk3v4euJMhQNWRtsSRUZvd
	PCkVeODVtiJjgtunOvTVDpH8/e4KES9s4As/WD4TqgHC89yn6jrfQ0m7zS6hgkqzl4ILHghcsfS
	/L7NY5RTRZmSv3FGdiKAs5uA8oO2cVC7V72dPq8MxJZnHyi/PxOBNIwOKt67pZLO2jZIUKA0FvK
	rvXh5eG72ftRNvC4MTNOtxwfuZUXBPVGprEfOs0yakntDg9/1Cfw1G+2huB4qvbj2KhSFu9sxot
	wbSwtzx25slewXGMU0sSzqbSBJ4EzGzHBfbz/hkWPuEy/RuGD3yqXmRAqTq5xYIxJ1PiUQCqEBm
	7HtgFu2w==
X-Google-Smtp-Source: AGHT+IE4NH3mqhfFMGevhbXMAQxKll+ttwxjlpittKvsFjn+CaMQpOl2cv8RmzF3ghkopKQb71oVug==
X-Received: by 2002:a05:620a:370f:b0:892:636a:5675 with SMTP id af79cd13be357-8ab9ade53ffmr1387887285a.58.1762139958109;
        Sun, 02 Nov 2025 19:19:18 -0800 (PST)
Received: from [10.73.222.215] ([142.182.130.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ac03f50616sm586898685a.58.2025.11.02.19.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 19:19:17 -0800 (PST)
From: Samuel Kayode <samkay014@gmail.com>
Date: Sun, 02 Nov 2025 22:19:08 -0500
Subject: [PATCH v3] MAINTAINERS: update PF1550 driver email address
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251102-update-email-v3-1-8e2c4a4507f4@gmail.com>
X-B4-Tracking: v=1; b=H4sIACsfCGkC/3WPQW7CMBBFrxJ5XVeecWwMq96j6mJij8FSQ6gdI
 hDi7p3AolWlLv8fvac/N9W4Fm5q191U5aW0Mh0l2JdOxQMd96xLkqzQoAODW30+JZpZ80jlU+d
 AQ48JyPFWCXKqnMvloXv/kHwobZ7q9WFfYG3/ES2gQWcbcu+IInJ426/9a5xGtYoW/IHBwB8YB
 YaNS4jAsTf5N3x/zqr8dZbn5uc2NVBjLfexzLuONsmjc2SGbA1Gg4GiD8b53ltLXga57AGSyO7
 f9chebTEBAAA=
X-Change-ID: 20251029-update-email-f8ab42d1a5e9
To: Lee Jones <lee@kernel.org>
Cc: Lukas Bulwahn <lbulwahn@redhat.com>, 
 Jerome Oufella <jerome.oufella@savoirfairelinux.com>, 
 Samuel Kayode <samkay014@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sean Nyekjaer <sean@geanix.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762139957; l=1937;
 i=samkay014@gmail.com; s=20251028; h=from:subject:message-id;
 bh=ziBDk35TYk7YiW6K7GPffNVDP98Fs1iA4htR5FdmfDY=;
 b=ziXHDkBCkPPalk7Y9MwodVSJGPE4Eb2svQ5s3l1Q1PdMrCt3OHBJY5qgsSHpibllG+gdqqxfr
 mgZ2ua0CkxjCFisZ5ZJczWkKvmrDNjmZgKgh+KP6FptmivPHA4+Zeaa
X-Developer-Key: i=samkay014@gmail.com; a=ed25519;
 pk=favoK08ilD1j62PrGf+RHihBzbqJGWMC6f2nszR5UIc=

Update Sam's email address for the PF1550 PMIC driver.

Signed-off-by: Samuel Kayode <samkay014@gmail.com>
---
Changes in v3:
- update .mailmap
- Link to v2: https://lore.kernel.org/r/20251101-update-email-v2-1-175d221ec40f@gmail.com

Changes in v2:
- rebase on ib-mfd-input-power-regulator-v6.19
- Link to v1: https://lore.kernel.org/r/20251029-update-email-v1-1-f38f45aac2e8@gmail.com
---
I left Savoir-faire Linux but I do intend to continue maintaining this
driver.
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index d2edd256b19d6d68e2f4268b098b1845b9bddf08..857054460bd9f971421082b958e207ebdedf63cd 100644
--- a/.mailmap
+++ b/.mailmap
@@ -686,6 +686,7 @@ Sachin P Sant <ssant@in.ibm.com>
 Sai Prakash Ranjan <quic_saipraka@quicinc.com> <saiprakash.ranjan@codeaurora.org>
 Sakari Ailus <sakari.ailus@linux.intel.com> <sakari.ailus@iki.fi>
 Sam Ravnborg <sam@mars.ravnborg.org>
+Samuel Kayode <samkay014@gmail.com> <samuel.kayode@savoirfairelinux.com>
 Sankeerth Billakanti <quic_sbillaka@quicinc.com> <sbillaka@codeaurora.org>
 Santosh Shilimkar <santosh.shilimkar@oracle.org>
 Santosh Shilimkar <ssantosh@kernel.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 2a9330f05e2fca6b8661bb698dea17dcfd7fc254..c44d2cf7e7b85104a6eb09142da8ef3d9fa7e55d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18608,7 +18608,7 @@ F:	Documentation/devicetree/bindings/regulator/nxp,pf5300.yaml
 F:	drivers/regulator/pf530x-regulator.c
 
 NXP PF1550 PMIC MFD DRIVER
-M:	Samuel Kayode <samuel.kayode@savoirfairelinux.com>
+M:	Samuel Kayode <samkay014@gmail.com>
 L:	imx@lists.linux.dev
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/nxp,pf1550.yaml

---
base-commit: a7d6255a0bf302c028ac680564633a6aac5f611d
change-id: 20251029-update-email-f8ab42d1a5e9

Best regards,
-- 
Samuel Kayode <samkay014@gmail.com>

