Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32E62FCBF0;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769157031; cv=none; b=bpBoUU27wsI5ZD6PhDr3KDtx5jkcWFiGdkCB/d9yQevsnIBTkL1DqMwjttA9paqi5uTZxPe3dYcMzn1aY0D3feDfVLkbNUW3zICfmxvVJ8gvH+stdtazAg5IoTwyy+XlrcRsNPtCHLhUZAmN73szXiWb/jq6YOSiM9XHfOt4ohQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769157031; c=relaxed/simple;
	bh=hwCyQcZBbd1CxtM6jAHkplhjj5WWWGRjHESp3qHcyz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvbGVCYqemKi8VnIJRPcedKbdL8u3eBIKu6upyE/pS11A/q+ZS7SND3J2O2TSO8t+YosrNR/SPdNuKx/XTC/fjMYyB0NkHW2bpiZw2IvhPqd64ZIzB1fElebdHmMXiMKtppZvV1oXlwuFjpWfZQAeL/Sf1ZVe6/oqNPhnXQfv8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6BWgXtH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6BWgXtH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1CBFC19423;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769157030;
	bh=hwCyQcZBbd1CxtM6jAHkplhjj5WWWGRjHESp3qHcyz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I6BWgXtHd5gAZjJiq2vT0WQ1ByejXBFYgRVHFSkMmRC5kdgM6nORIw9xr+fka+xl5
	 7z/uPY3ybJHQCE7drr18XFM54cfydmgTgckg2xAhxNOOb5mZOvODobkePGk9SutV6c
	 csf1D/woMpLQIS+HSjCfmBSbkZMvPAqRCpkVoDFE1Y1UZLWtG3TiFzlZnHh3R6HHPn
	 beDJS7v5nyEWLK69sWhShz2zvAO98Gdq1wVknV3x0dV0MPu6aGViwx3ChAi3rMA+0/
	 SMdXGKtfWNpa7IalSEns111cY8Oh3wj+S1aHBhRvKjJh1MA6a4McR8A4OT695JUw+y
	 8ThWNzmSrdlAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D53D7234B;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 23 Jan 2026 09:30:28 +0100
Subject: [PATCH v5 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-mini_iv-v5-1-29bef040f236@gocontroll.com>
References: <20260123-mini_iv-v5-0-29bef040f236@gocontroll.com>
In-Reply-To: <20260123-mini_iv-v5-0-29bef040f236@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769157029; l=1193;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=FPnVFuGZ4VvNvtuoCGBWX/d1Nj9ZPjClvU+nyhEftj4=;
 b=JSjU4HbXvU3WmGRV+yrCT0RszWCpRZI7l8CjvSvavtnFF3OXVmOK0FdMfFlIqgmfnC9JkIEDm
 fAmziTVDOAoDlmv+zmHqFgVSUa+qfBbrJ4oKPapHRoqw8b23t4kmPsG
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Document the compatible strings for the Moduline IV and Mini.
Also add a compatible for the Ka-Ro Electronics TX8M-1610 SoM that they
are based on.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..c76c1731b4f7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -996,6 +996,14 @@ properties:
           - const: engicam,icore-mx8mm             # i.MX8MM Engicam i.Core MX8M Mini SoM
           - const: fsl,imx8mm
 
+      - description: Ka-Ro Electronics TX8M-1610 based boards
+        items:
+          - enum:
+              - gocontroll,moduline-iv-306-d
+              - gocontroll,moduline-mini-111
+          - const: karo,imx8mm-tx8m-1610
+          - const: fsl,imx8mm
+
       - description: Kontron BL i.MX8MM (N801X S) Board
         items:
           - const: kontron,imx8mm-bl

-- 
2.52.0


