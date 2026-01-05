Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A40E2DC334;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767645603; cv=none; b=NN+LA4RIIbm4J77dj8JaTyxoL9NYFjBXJzzpZju3ygf3VVPMvqZYqqf368oUxqI8Lw0RejJn0IdQWsdGG8ydIqzo3UBGvxOoEED9Er2ayJXbbdw/vW6OAsjSc8Cg4MWWvc5zUK/cmQvGrTYz6gYC0eMo3JxJB2tH5Wif5CPUZi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767645603; c=relaxed/simple;
	bh=G3CRfHErrrKcZhENL4huqEWH+BxfPIUut+G9whJnJ9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h4IKrlWfH1q0fu83y0y1o15tYbHa7xq5N33UTPcRDVar2RWVvjkPIam9rtSwNC9ihTr5LAC+CXQWoF5PD5JY00OTZzWk5G3Mdo8phjbNQfZVLWk7Q/pmH5yX791O4U88iYtKzoh263Cl5NxRKr59N1LTH95W4EI5kmnrCpRnStQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJlzfAMA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJlzfAMA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23FE0C2BCB3;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767645603;
	bh=G3CRfHErrrKcZhENL4huqEWH+BxfPIUut+G9whJnJ9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tJlzfAMApVLWBMTba961mS1yYClTAwokdZuRDXUVTAExKEq8ewOSKTFZE3Vlp1GF2
	 P+84pGCTp3c6XwxXaR80e9x1IrQ1g3WjXGbzd/9aK49CHeebukBRGHDuK8PCNwelDj
	 ZXBofKyO1eJELSl9FCv/s/IFZhVcEgrfR/lChzBzBoouWR+EjRCOW8JgLl6tk7Ba8l
	 WFJB+wQYCM/w6McoGGKxeJUq8mGrES7e0jMQX7kJVGLohPspiPWGRy/qn0+GbcEdBt
	 MwxqoK5N4N+sfFiypHq/RDQFr+/3wZkHYk/Agj7hkX1LgpzwmvfaZUImuW1QyHC/5h
	 6bCnao1tYp8/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1979FC9833A;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Date: Mon, 05 Jan 2026 21:39:42 +0100
Subject: [PATCH 5/6] arm64: dts: imx8mq-librem5: Set cap-power-off-card for
 usdhc2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-l5-dtb-fixes-v1-5-f491881a7fe7@puri.sm>
References: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
In-Reply-To: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@puri.sm, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=751;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=3FmSteF4kPJyYTm0fb0Nk+/Wxx/y4JRs2j8lvXT5ndg=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpXCGhv1BbnzOMrNgXf2F2pqaDZuF2imhh/5Gfo
 HC/cycG2waJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVwhoQAKCRDo8jXPO9vD
 /9ckEACMLR31FW9Rh+tgbacz/tzzqFw90zuYdeYeu0//kRl5pLccTfrBRioSptiQxRI3NbBgUN+
 6eq6rD/MZoFwEV+ReR1VTjiB4gh4+nNcE0uXyFsCsU8qgdw5NQKPgTUm4FviecoKvLS1jpIjmzG
 PqDj/P8y7kujaU06lHxA9YjZzHxDnl05hYc6ry3YQI/cLmPMEDpL7Su7e/X/M1AU3GP7dNPBGZJ
 nDbOZ8VQ227IfaJn7n/ktdWWTdWQS6WWYWaeSA0NgqCOxAtKoQlJU414nbgpwwNQDIWTmi13pl5
 Hc9Rn0iHaVGedwvrlxb6GoR2yELakDpe5Ma/atvRmxnnG1E4kBzMYEb1JWtx6IzcXWwcjJyHNvR
 V1tCDvnuJIT7ir68qCkFA7qwFTrPZlN1raoSAOQOoDbuDcbHROO0M94vVjhrmMlbmqh7BdlJkju
 xWgMngrIgB8cB/3bFyhjOimNrSt2tGqDZ9bnbvIfBH9H/HE3qS54pK9nqz2Ip6lSDXMG+8M+QY8
 PogIo9dIkgqvuY0omhWoKwDKtJSybKlZhXzycB7Z6RBghUDtSeXEWTYJLjNOBVdemKv2/+4ofdS
 LZ0XQXRl1MKNS7EFmT6ERJG6/vg/bV7Fwnt43WHfkKFtzyQ0tw2G+tqhPtE2VNvg8GFogE//pL+
 +hSsDVq1CISEuyA==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Reply-To: sebastian.krzyszkowiak@puri.sm

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

This is needed for brcmfmac to turn the card off in suspend
since 8c3170628a9ce24a59647bd24f897e666af919b8.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 0e3c103dd7ff..22b1a29ad440 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1437,6 +1437,7 @@ &usdhc2 {
 	max-frequency = <50000000>;
 	disable-wp;
 	cap-sdio-irq;
+	cap-power-off-card;
 	keep-power-in-suspend;
 	wakeup-source;
 	status = "okay";

-- 
2.52.0


