Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3D81B0F19
	for <imx@lists.linux.dev>; Sat, 21 Feb 2026 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.196.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771675381; cv=none; b=jaN1JI5lueTlzNe6rdyb1NhZg10BhrdpsVOhVbAicdLzAlcxU43p1GfLfm704b5X4J6F7fvh54nP/0Zv1QlPybyoCnMRR08vuAYr2lYjnTL34ISMZukA1rt9fOW7Z335MizbEwi81OOYGx5IDOtc0CSt3xShhJethUwc9/Hmo/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771675381; c=relaxed/simple;
	bh=lElJz2q0mo7Dbf27ywzOet/wsoBKWaPVLwbz02KuJds=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mw7LLnxUAoujpgzwgAboaklt9CFb+ZKC0/Tlv8fGHet1vT7V/7briVgVAqN53ZEKdtpI0jP855lb1BLxDXh98JOSu/mnx7manoNLMw9LwMKahDtKD+tMtEGJ7uo9jzP6wAEuiG6HMcEQ0mkcd28umBifzwNcmaUACNxmnyNsJrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=PePbW5/K; arc=none smtp.client-ip=135.181.196.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="PePbW5/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1771675369; bh=lElJz2q0mo7Dbf27ywzOet/wsoBKWaPVLwbz02KuJds=;
	h=From:Subject:Date:To:Cc;
	b=PePbW5/KKgzTyhAAvHH0RLr8d0GQIqE30UMFmYmDDASMHRzX8TwWh6x4wXmBptLGB
	 WzjiGkWxQKPvNqMFgmme/yNUrRHjCAcCzeBxZnBl2JDtDFzT02IXCpSrku4v4/N2vS
	 lK5RinxER8AKdcHHY+UQIPnbbABJzAPErYJ0pEMKgQ23THbSCWtwCKY6eteS3zgnNP
	 XKGQ5MCkZdO5Y8ojUXQ+ZCeAGRl8LBe6fXJxbpmuTaUF6RdhtXRPhPK06ZvVMUyhbB
	 pv/ybg2DLzG18rg+GqVY2iihmOA7poFTJ6vi35lnrJfq4bJODOfAsnmkkGZX4QHeMm
	 GzhVrgfq2Ju9g==
Received: from pliszka.localdomain (79.184.40.11.ipv4.supernova.orange.pl [79.184.40.11])
	by ms.puri.sm (Postfix) with ESMTPSA id 8AC571F511;
	Sat, 21 Feb 2026 04:02:48 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Subject: [PATCH 0/2] arm64: dts: imx8mq-librem5: PMIC voltage changes
Date: Sat, 21 Feb 2026 13:02:09 +0100
Message-Id: <20260221-l5-voltages-v1-0-daa8aeedc86c@puri.sm>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnBdmi1PwVcYOsaYaqHUkKgPx3
 dft+B3+/wRjFTboqxOUDzFZc4G7VRBmyhOjjMXga9/W3jtMDzzWtNHEhpGbrh2bENl1UIq3cpT
 P//Z8FQ9kjINSDvPvkSTvdl/INla4ri+fqr2PfAAAAA==
X-Change-ID: 20260221-l5-voltages-fe476d4cfe17
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: kernel@puri.sm, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=lElJz2q0mo7Dbf27ywzOet/wsoBKWaPVLwbz02KuJds=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpmZ7npDKhokjbX+6yemtwz/V5IQvX4zuTgt7ui
 UgasX+0Gv+JAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZme5wAKCRDo8jXPO9vD
 /1VlEAC5LXbIBRnAzM+KiOwPzEIONlrtBGI2VaxRUQL6HXu3c5vUK7flltSoJ2fgbykdt3aZfTd
 FFgYvpRk/0Lg/2wKPbvJ8AK5W6f8yRGyHysD7lJ7My0evTHO0RO8h3RMbQ+dNrvPYDh9wNpXZup
 fnoeWqnV4VbmwIdww6uUjrXi20v3XTqK+QxjmA2TJXdkLfLy88mu01aUTL08L6TNRfREWtCBSMJ
 IgowFjJICHjat9SlEMoW8bUXhXpJWSO6qMaLvlHinVuBHp0UA0kIckxdTQ5PlomVCfSPyK/W5I6
 vqq6GRSZMW2ZVPZbDE7O1ax6MrCgNeMLlBNvmxt0B6d9trCxYCq1v0wSdM4UIzduACvlFh4962E
 GuUs7X0zwQhU2Z/caLB2CyamUkPl3E1DrBTnGZEJM5wpx3UJ3NA1cuAuXmjPHho2cz7lcm2ueCo
 ejfUkfJ8cKGinD8tWM74awMtvgtDGwjCkkcKGzN61duN6cPmNEDuJDVXKFFBmqtJOXL0Q7eb3SZ
 DW+wt2j939gnbysxyI72Z8r0/kTKHuVbLQhbPvPlI/125IKza6JZUa9zn9MypTqOXVDJNXE0obu
 98RDAl8Qt/KdtBXOZwcPP5e+1EoQ1urE+FZFqCXbT10aEVVe0zyZLxigsVm8x67KmqixgS1IKJ0
 o2j9iBn3TouUq1g==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF

Simple changes to bump the voltages up to their nominal values to ensure
stable operation across all units.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
Sebastian Krzyszkowiak (2):
      Revert "arm64: dts: imx8mq-librem5: Set the DVS voltages lower"
      arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V

 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  | 24 +++++++---------------
 2 files changed, 8 insertions(+), 18 deletions(-)
---
base-commit: d79526b89571ae447c1a5cfd3d627efa07098348
change-id: 20260221-l5-voltages-fe476d4cfe17

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

