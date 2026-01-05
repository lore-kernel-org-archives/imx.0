Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDE727F756;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767645603; cv=none; b=Mlzlw21Xl+ubh2POXYxsPg7eRSy5ZJ9DQ8jycAhACcrARiEUmkO/QQoTKD1OafvyDA3xnZDs0ubp6MivyxnaMc39m3j1vzp706WMzlSd8n7Vl4Px/9+d6/EBX42Kw5W/m8A41IvLbrWYsJwVzwSJREQpVBk3+q5aHqmAEKfe3nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767645603; c=relaxed/simple;
	bh=h1l9P7NkAKNJ+XD9BctiE5OChOQI9lTMcTs+NJRvzLI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SZC6YgSq0rwXkoCLWvCgPdtlzYaxukAv7zqMuDvdehjkdBqDLwzN3803mJb7MJiTOwqOJnX/Qt+ZKx88R2avGWZ+Sep079L51jCxBZpzBaWffiblZNXJxWhQkkoNUJXypLWbPgQkks1g2pAgjUJtrgfw9ZTI/sntMYnSEG8ATbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBX0p6xg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBX0p6xg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5445C16AAE;
	Mon,  5 Jan 2026 20:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767645602;
	bh=h1l9P7NkAKNJ+XD9BctiE5OChOQI9lTMcTs+NJRvzLI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JBX0p6xgpHjvAu/bkawjO6M3bSa4C3jBn9DZJHGgFA+85IcY2VHWczxR2Pr1/rkUV
	 BzyXr/7G8+hKhROw7BxHiMjt6qMzWigYrXntPy7auIXCnYkli1oI610kKH4kulUkza
	 3KDbWctRjlCQKq04iqmfXjPfCoGdA8oKZA7VVIs8wt48VQqGRYvmYVi2VSQU8dWap0
	 zIObg0itpNPua6RdnPxBEylzfLLf8h7a4hCpsODD5LPrlAuBBPHNYalZocdwXo8K5y
	 ZCRQyPM9Ewd6KPlS7H7KpR0LKW4pa3uSDKytVGQ53WHqKt040eXaXhxO+iCYS3D+HY
	 hVK8ochJgXB5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CF6C98333;
	Mon,  5 Jan 2026 20:40:02 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Subject: [PATCH 0/6] arm64: dts: imx8mq-librem5: Various improvements for
 Librem 5
Date: Mon, 05 Jan 2026 21:39:37 +0100
Message-Id: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIkhXGkC/x3MQQrCQAyF4auUrA2mhVbGq4iLzDTaQB0laUUov
 bvR5cfjfxu4mIrDudnA5K2uzxpoDw2UietdUMcwdNQN1FKPc4/jkvGmH3EsnAbJKRGVE0TyMvk
 PUVyu4cwumI1rmX4ns9bVjw/2RQz2/Qsz70gwfQAAAA==
X-Change-ID: 20260105-l5-dtb-fixes-ca96eb9900c7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@puri.sm, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Denis Sergeevich <galilley@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=h1l9P7NkAKNJ+XD9BctiE5OChOQI9lTMcTs+NJRvzLI=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpXCGgxphxkK6Aiw/QlxhgE83NF6pMFn9DuKqeI
 qoUnWOJCjCJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVwhoAAKCRDo8jXPO9vD
 /+P/D/0Yw7W5ptdqIAPyLsNULtdCV2DUmIpYdm5blfamHr1H20WTIoNAsFalOpCfyXZcpnMUk3q
 m9YoMsEfQJlxGo3ysQMap3QuO32IhD+StUSkHVyteNbTuT0MKOYWjcH/Sdr5U/7Vq1Dfien7aZv
 Cl2/zqW2hLswCdS5hIfcJtLTiNJhDkRPtg7O1NV+VgQltp4UogA1/+WCkZ8AzRGRNvQw94UsitQ
 lWx3ti+NqCH9MfLqHmZIFUCOa+eKIL8PYkd04WRmpL8DRAoCGmMqtDYKz0NoaCiEDmm8bsmM+1Q
 Ol3XWNdu0tA6ej8b/EOGyaQsI0V4p5B5E+j/LOoc1xlMKpX1JMH6nZWfv0WFsBBtzhwXix1G5Rz
 y8G3HX619aSedWM8S9sngPJbkJJN2UhNZtYTxW/UHMvEkTqhYvSyGLJ9vYj+Q/uXyG/DD8fzui7
 fn4tT3fx2bAbYY0zAQtA59vulOJDmvIefkdzTUUWKJ6Vysq/Q/XIy/kshfgoNDrmLtD6GOL21vv
 BBL9H+jZqa4lNoixAgpERI8Kcb4zaED0aYl34ao0pbWmjw3zuNAIZ5dLGWGWTOt2XutGVhbTLik
 kPR6IWj7AMmm3q+mkm44hui7jFZBzCW2PAQYnXD6dCWk+oPOCpdjnPnHdt/psxSnWFx8AnKZGne
 piWwewzgdNue6HA==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Reply-To: sebastian.krzyszkowiak@puri.sm

These are various DTS patches collected over time in Purism's
downstream tree - fixing the vibrator's PWM, improving reliability
of SparkLAN WiFi card and I2C buses, enabling power-on on RTC alarm
and cleaning up an unneeded property.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
Sebastian Krzyszkowiak (6):
      arm64: dts: imx8mq-librem5: Enable I2C recovery
      arm64: dts: imx8mq-librem5: Set vibrator's PWM frequency to 20kHz
      arm64: dts: imx8mq-librem5: Enable SNVS RTC
      arm64: dts: imx8mq-librem5: Limit uSDHC2 frequency to 50MHz
      arm64: dts: imx8mq-librem5: Set cap-power-off-card for usdhc2
      arm64: dts: imx8mq-librem5: Don't set mic-cfg for wm8962

 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 67 ++++++++++++++++++-----
 1 file changed, 54 insertions(+), 13 deletions(-)
---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20260105-l5-dtb-fixes-ca96eb9900c7

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>


