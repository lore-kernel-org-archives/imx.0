Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1299D1F0E24
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 16:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832523; cv=none; b=BspL0QO6MGlpWl6yrH0pWbeWN9RaHCOyvMpqJW/ZUhok4lPZS4YNuGWGSDsdsZ2pG8NeRZBzsM6FOum8wuwq4wisZW1nXkoHYd/201f73pNOzywEYTAX9gjlUB/idR0y1j49dNQmRQBddhaLNjtq5qevW9/wlV/rfxzCDlo/L+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832523; c=relaxed/simple;
	bh=QXE8CKFwmIeb+JPAQUReJotkuCcr6O5N8pxWfDgAg1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pnlCh7YldDXPsYgfZOBhCsBAlnZQd4avyRmOYVt8fbPHUDTLE2UBNkOhhtYhHatRdkg9+3aWKWPLKMwuoUEv9zCm3CiP5lBSgISNDaEFMQX16yRtNu9yhZ0jkpkokZpCvRnWnjbNwcx1tfWcsCKJDoeag5hiPKFKt7WeeQMx8/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FF+nbyaZ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FF+nbyaZ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b2fca9d7872so1596014a12.1
        for <imx@lists.linux.dev>; Fri, 13 Jun 2025 09:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749832521; x=1750437321; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHPrpo9d42nRJm72Dq1MnICc6IUuyfQPRBp7KXTIMQ4=;
        b=FF+nbyaZAozS32g55Mc5g0EYgh6S2cqf2+nQGTH5EzFCJh7CaySV/f5DmCXjV1ponZ
         xRnBu49VGJPYd/aktT3n5Lr7DV1D4MujG3uQZxsaYHy3+JX/c2YvjUEfkiu0i01J4Gxl
         uCeWZED7QoJ3PIn/olYWh/m1oOh0QgRroU5EZASAb+zbl7xM1VEjUI4I0zU4EOYSTvno
         ARTRGFdeDYVnwpvB8kbpio/QEv08Boc9X07CAE73wUmq/JO9LlYJa1VVE6Mc+ErDam20
         5cAP4UHePe3gIrCRNHimKml2nIylWdrjDuVYi6JrD7aagbiKCB6TZmeNHbAPmExUZo1N
         6zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832521; x=1750437321;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHPrpo9d42nRJm72Dq1MnICc6IUuyfQPRBp7KXTIMQ4=;
        b=Hfmwxkm6EYl4AVLQakFLFr0la69KzoHgeYnV+lW6LSP2DwWN6sHwX3BLJjgzwm4MQt
         CZgm9RTxzolFNHCJgxV65vBSVU4569Bjud/q+Rdgv4prIcazVZhpENmJ+Nmu0pFVqSv6
         nU8PXqKfIR/hUwuJ32xysYjUo9CJj0gKjL2zcPvyh5rHNnP9uGyJP0wUsmsaAPZ7B2Wc
         FIug9FEWZqaj1Ys/ZmOppRl67jxuvWnboGYs61KOe5QQ6v3kQsO/MGflyyI4L9erMemI
         bsUR+ofpFW0jFF7Kmln5sNonkktL88C7nAIpluQNSNz90/Uj2lY8lhKTJ17GRdg2+Nqw
         1Pig==
X-Forwarded-Encrypted: i=1; AJvYcCVD1estRV+9q61ymtifDKsH8BrZndfH+vji3rdk+HoQcOJAEgKLg0iMRPF6az4kuJ4yBvI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyH8fC/Z/hTNM6+IQcwg+O4C/If4VgcWXBurSxKc/313ZWIAJmi
	iAvydpNG7S/iHEU/rqKiUS8UxdpcFizEcA30c/5vQ3clSm2PeGbHcyTb
X-Gm-Gg: ASbGncssT2yhsI/Af8/iDKYA1Rk9eD68zgUsMr8IWnn3j1RD9WvZUiPnTWPiDt3DRf3
	TnZVR05IiY7+O5cT890Kkugu7dlIpSpj+zTiaovMzcGs2Ew07nXUYZ+lXhStUueIuVHAx+VzRNR
	VUo9wCHBwESHjR1ai/IxZ4McHYnblYqBYNUDHmtRj0mEXuHklQbn1brns6xjaZFfJbdX806xTyc
	b1OSd6IGknW1r3g4KfiGJqpNYsYDIMBZQtUUcNo7N/AczSq+xZEkKsUT7facUdAbABcwy5oy3sm
	D0fPpEZGmfOqxcflq09MBALOr5NqfT/LpAiTDvur+WfOiVA8g+YEoqJb7JKR4JPzH6p1zZY5e3S
	wTGqV+befWgPeJtZz+l7B
X-Google-Smtp-Source: AGHT+IGIuAqQa292qV7dqgToWK54149pBTrBaPodmpn2s350eBZtY87Pv6smrPbvL/pWn7OY37TTsA==
X-Received: by 2002:a17:90b:1c04:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-313f1ca7f9cmr519630a91.9.1749832521202;
        Fri, 13 Jun 2025 09:35:21 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b5a85dsm3568672a91.38.2025.06.13.09.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:35:20 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Fri, 13 Jun 2025 13:35:04 -0300
Subject: [PATCH] arm64: dts: freescale: imx8mp-toradex-smarc: add fan
 cooling levels
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-tdx-smarc-imx8mp-fan-cooling-level-v1-1-59aae8fee2db@toradex.com>
X-B4-Tracking: v=1; b=H4sIADdTTGgC/x3NTQqDMBBA4avIrB3Q1KTqVUoXMRntQH4kKRIQ7
 25w+W3eOyFTYsowNyckOjhzDBV924D56bARsq0G0QnZqf6Ff1swe50Msi+j33HVAU2MjsOGjg5
 yuKi3UFKTMMMENbQnWrk8k8/3um7Lrur0dAAAAA==
X-Change-ID: 20250613-tdx-smarc-imx8mp-fan-cooling-level-b67265ae2c49
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

The fan controller on this board cannot work in automatic mode, and
requires software control, the reason is that it has no temperature
sensor connected.

Given that this board is a development kit and does not have any
specific fan, add a default single cooling level that would enable the
fan to spin with a 100% duty cycle, enabling a safe default.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index 55b8c5c14fb4f3e7407243760ac01b0aca0dacf5..5f233304cea747d3f04a748265f96696668c9d6b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -213,6 +213,7 @@ fan_controller: fan@18 {
 		#pwm-cells = <2>;
 
 		fan {
+			cooling-levels = <255>;
 			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
 		};
 	};

---
base-commit: 1a2ad59da68dd294f994efbf68c5d671f6b42fad
change-id: 20250613-tdx-smarc-imx8mp-fan-cooling-level-b67265ae2c49

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>

