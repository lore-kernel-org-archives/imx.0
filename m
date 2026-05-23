Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0D836C9EE
	for <imx@lists.linux.dev>; Sat, 23 May 2026 10:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779532036; cv=none; b=R2jyOXR3RO5F7+7W6UTyDMMUvL2MnKm67FyxxGvZXMXwngmmgrZBFofZil73xkcKJcaCLRIgK39KBJDTGmC7aRvQNivSgP0J6GjYVvVGYpBD2iVlzE1BoEUn04VxOcyoSXlEp9bOcQrYpbdppD7dH6l4LBkFiNxtWhEH+UT1bg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779532036; c=relaxed/simple;
	bh=qcgqBwja4CHu5wwuF/A96Ah+f+QE9tKst8z6RkEiVGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FRseL1xTFZT3cpnHQ9WUoqaKRM3enbf18SIRlrOd//+yEWT8w6CwNlDZAi/3XIPJibSOaYzqrucEb3GTLNdy3ig/OwIuYfX1mbCyfeUl3zZk42qXBYlU7IBNbyYapvyC3J8cjII2pU/aSGzja5t5MQT+rSUAxnntSrneqNM7C6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8F3gx3j; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8F3gx3j"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-841882f8f4bso5536b3a.0
        for <imx@lists.linux.dev>; Sat, 23 May 2026 03:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779532034; x=1780136834; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6UvRxauUxHtkSOdYEC9vPPJYNErnPXZyVXoKgtsN7o=;
        b=m8F3gx3j5S4iKjhukC7OJhPgcSUAsVnmmayTkI4H2q7Zl+QfWRjO1rk2aYTamJH80u
         6BCcDqdIl0ijvlTD1Y1vbgHVlA3veWLE6dBJ+2QN3zRg6bzsqSizvIAiz+A13sKxMV7H
         N9Cqs4QczSoUe7ioT8yecyZBKxNc/CKcs7REkQmc8lgnlnZ3fAFx5IrrSB8IM5bmdYhY
         zDLOkxPedRGNZ47rl3pfVTD3YHJEdwtxiLNUHDX6YJCzROSF6Jn15A8tWBHwvo195yhz
         rFC9rC4Iad/9cEtdvU+sbcDxLnP5so5vGHztdszbKuPqYCszgSuHFfWIuO1XP71I9k5d
         UPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779532034; x=1780136834;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6UvRxauUxHtkSOdYEC9vPPJYNErnPXZyVXoKgtsN7o=;
        b=PWvTkwLmf9nW+RHNlrr6RvOtZwOZF5EwZoMXQStaTDvbMAd5TSa/iQ/qqoxipWZXLm
         /AcPdxtdkQrVKe4Ni76cYJOUp8TZTZs0pTKZQsGpi31H0rndNSEg1nMBs76ju/vQg7PC
         AXLXF59qJOx0MUsuKSIzSOTjP5AVqngBRsiZBTDa6BiTLINi4nJtIOBjZQaj+cWwmAuu
         /VoVOUxExXnYrb/val1+TxE8vANqbB0X06T9j5z0dtmaZ9o17z8SUIgDx/1/OM5BBwVf
         5kiEgt+LzYO13ijAezsDe+6yBfAJbvuUnEP1EyJhsVycXUl28suGKHjrpYZN2tk0i+m4
         RDqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QUyRe1WLwVf7cYKkxL9mN3xWyrXvcvlnERYwnOjtjUdna8ETDEf4/O9dCKeakwiIR2nQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrEzty6NQkkjAWgc8YvN9hMmlmBkIAeM39E3Jvw9kWRWyoc+OW
	P9Xg0Tklxmde4//IkWgzEox3bkTDQBH7Cf+LtKScCq4NVgt2QO+34DPL
X-Gm-Gg: Acq92OEt69JIegjuFs967CnTgfzj0uLVqzmSNg0gYHW4yBVIXpR8sR1tK3ed9fQMjQR
	22I/QGxqYs0hYbH0TkAznkQe2PbnIVjECb1f86OvqeRsqTJBvbl3Vs9Sy24lW33ULG4wmoB1p6J
	HfAa1qerbULuBZneTOCRZ5/JF9Hq+oipz3hrTPxpt6ZHWLaazJd2Jui0VOK2lcVuB7FIgQO/Il2
	ax0XYvjVhMMjUNKdxc5F80/Wjr6wx0w9x515Teaw+04FMjXRM2K+whYXZKiyM/TEcnkUiNAOwt/
	C6NXT2iMWUJJIeblQ4hTaUowBFmU0+2HUCPvAHt7ZwCVn/bY2BZTwC32RYc1xQ6e51oDjtx2Vgu
	hybYRgy4An4WNS1jm6nx3NZOjWP4vdp+Buau1WvnWjRTnUgyXkBYy08mr9/coqrYPo7TWCJe3X/
	zj2CL4QdnfyfegYqpsQQBGAti0DIRDuMj6g2OZLrnsanwKtiPXEP/TnldyozDS65MjJdg+Al39Y
	SUiOq30BXBxZDe8uw==
X-Received: by 2002:a05:6a00:1d86:b0:834:df57:9d36 with SMTP id d2e1a72fcca58-8415f66dd37mr7142262b3a.25.1779532033889;
        Sat, 23 May 2026 03:27:13 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164e9e522sm5137201b3a.36.2026.05.23.03.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 03:27:13 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 23 May 2026 18:27:05 +0800
Subject: [PATCH] pinctrl: imx1: fix device_node leak in
 dt_is_flat_functions()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPiAEWoC/yXMQQ5AMBBA0avIrDVpKwRXEQutKSOUtIhEenfF8
 i3+v8GjI/RQJzc4PMnTaiNEmoAeOzsgoz4aJJcFz2XGNrJ6dzOj5WJKVKUps0p0ykAsNoeGru/
 WtL/9oSbU+7uAEB6uc0wSbwAAAA==
X-Change-ID: 20260523-pinctrl-imx-b198f8391abf
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779532030; l=1610;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=qcgqBwja4CHu5wwuF/A96Ah+f+QE9tKst8z6RkEiVGM=;
 b=TDWZmut8c/UsJuZ34Imt8NoqEeM0PpEU9Mu+fWpsx5fO0+0lK/CKvVOP1rGb0JTH1GYl6LIQ0
 m4LTlwTPTOgB7znVwyNrGhXUgbS3V/d65TmQ7AYntqW1v8GFhlfnklw
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

for_each_child_of_node() holds a reference on the iterator node that
must be released on early return. imx1_pinctrl_dt_is_flat_functions()
has two early return paths inside the loop that skip this cleanup.

Replace both loops with the scoped variant so that the reference is
automatically dropped when the iterator goes out of scope.

Fixes: 63d2059cd665 ("pinctrl: imx1: Allow parsing DT without function nodes")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b7bd4ef9c0db..4a6bdaefa42f 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -547,14 +547,11 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
  */
 static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
-	struct device_node *function_np;
-	struct device_node *pinctrl_np;
-
-	for_each_child_of_node(np, function_np) {
+	for_each_child_of_node_scoped(np, function_np) {
 		if (of_property_present(function_np, "fsl,pins"))
 			return true;
 
-		for_each_child_of_node(function_np, pinctrl_np) {
+		for_each_child_of_node_scoped(function_np, pinctrl_np) {
 			if (of_property_present(pinctrl_np, "fsl,pins"))
 				return false;
 		}

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260523-pinctrl-imx-b198f8391abf

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

