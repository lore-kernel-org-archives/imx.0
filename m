Received: from mx-relay184-hz1.antispameurope.com (mx-relay184-hz1.antispameurope.com [94.100.133.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DA532F74E
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763385007; cv=pass; b=puvlHy5u7D+yOhXfkbsgPWu1zVQpfkTQU1ljLl8/sgUeYTPot6uR8jKfBjlH7Am6BDt4vPi+NOrlADoY0EqRdTvS5MBgZFDBThJdNb3aPK5vtAFgNkuosvJk4DejDRpOQkEcSOaCXZzLBPjbDl+xBOAZYvdHNddZyBMhTFmI5xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763385007; c=relaxed/simple;
	bh=7S1om9+suXBwGucmgeA10syG2yuj66RkQ/bxlFJO3Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F5ke1CljqrnMpnGUD4dr0hHOxTYFJM2b8J2dF+09iHRFCmqdvMSPBm8fFb9Vmwh1B/5Jy9xCxK9/ztVhOHs3We/Zivd5pEgbnUfC6Myxl2Cq5eD2O3qxYe4WUao8OXlTNoEq9vSGIiacmJ4QnMg8cJ2eKgQUQipV9C5r+GZgU7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=YAZRKE2j; arc=pass smtp.client-ip=94.100.133.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="YAZRKE2j"
ARC-Authentication-Results: i=1; mx-gate184-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=PVQJHrJWhlagKeC9ETVwWymdf23EeXs9KXo4Z4TKE8M=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763384973;
 b=DqH3GC2g1xv8Mq20+WGIKoWoRFujow2Me7MuZJnxTnCXMi/fqLi3K5LnL7R+td0kDDT5zIcg
 wTGES1E/0Tc1IF0Kbyj16HJ1oXo7Dmf/L+EOU6Y/vPDGDqrhQfE6J2zp0kDWH+PtZ2YENhG8iPv
 FmaRxAm4QpHfMbKYLvSA7kkHEeeKpPorPGvJhTnGbI/YteHQNp3Cy3S05o6S+9juIa4qjivC7L/
 Bfb1ZrySyI6z7JQnrqkVCvRprM4d0MfEkfgM9NB/zveFC3JrFvtUo2y6Nn+ol6kS6VLMakokiw4
 AcgZGwuJPfCl4mupIpDAIdVwrzM4NAbK74FKDW13LoXqQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763384973;
 b=YDoVI05BELd118jGBh9HIp9bHVtBw4LdHbYH9FgeA4OuzCz//5tJ63e7u1T9UR6xw89vhHNz
 NT8rieinbINadaSnFUdSy43q5oGnIrJacel14XfZ0r+tLXZAxRdiQ/klRmWkiETGcggHD/H1833
 gqRXvrjMMoWaotHmfq+vtafDePqSjm8Tcm5ifjCVwPAJIiXYFMmFRyLMON54uQJlZ8iKry9LkQd
 Rjd6mLUugd0/HRcTBaW2tlPuY7VtTbWEQUJguvKp4L5ITEdyH9ijonF7qGSWavwbXefGfdj3nOq
 uC6m/tj1lnyxND8p098DBQ/PliwHMFg8YwmJrB9Ok2HLQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay184-hz1.antispameurope.com;
 Mon, 17 Nov 2025 14:09:33 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8BF77220BD7;
	Mon, 17 Nov 2025 14:09:18 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add TQ-Systems boards MBLS1028A and MBLS1028A-IND
Date: Mon, 17 Nov 2025 14:09:12 +0100
Message-ID: <20251117130916.803047-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay184-hz1.antispameurope.com with 4d97PC2b7gzZcGt
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:e2915acad8a6ce551fcc14ba3130ca14
X-cloud-security:scantime:2.389
DKIM-Signature: a=rsa-sha256;
 bh=PVQJHrJWhlagKeC9ETVwWymdf23EeXs9KXo4Z4TKE8M=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763384972; v=1;
 b=YAZRKE2j/EXjmPk38dBeC/aYBYxhD27Uz3U9o3RelRyN1TLGrCvJ0EM3pm77T6hG+OS41Tdd
 XxJ00WWnlOqpYA3fNbNoI3TP/GLBHvW3/zXxstfvl0u72omU4cIUJ78UckN3gWbtNrp/7CXxyVa
 C0MKvUuHgbOYo5iprBMuHIhqwiTlMa1nkoZBG1ZzS0H78lxcF8loCxGX3l+9EdlaGIiB2ZZmSn2
 Di+5J8aMlDPBdleQlVjmBLtNyr3ORe4i26GFGF/DomxEoDHNw9Y+ZBhHMGiksVZXwcqznSrtZKx
 1raZMiKjp2tSCJ5PdeEJuwQ1HZRowLmi1eJ2IO3GiP9xw==

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

Add two mainboards for the TQ-Systems TQMLS1028A SoM, based on the NXP
Layerscape LS1028A.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v4:
* Add Conor's A-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 34ae86d370f69..2288ce271c230 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1666,6 +1666,15 @@ properties:
           - const: kontron,sl28
           - const: fsl,ls1028a
 
+      - description:
+          TQ-Systems TQMLS1028A SoM on MBLS1028A/MBLS1028A-IND board
+        items:
+          - enum:
+              - tq,ls1028a-tqmls1028a-mbls1028a
+              - tq,ls1028a-tqmls1028a-mbls1028a-ind
+          - const: tq,ls1028a-tqmls1028a
+          - const: fsl,ls1028a
+
       - description: LS1043A based Boards
         items:
           - enum:
-- 
2.43.0

