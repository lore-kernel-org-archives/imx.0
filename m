Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058F36BCF2;
	Tue,  2 Jun 2026 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392824; cv=none; b=h7Qf+ogx+r193i/3uBh9cu6fvH6DgkV4f+MtJDUM9CZ/elu2UboNMNM4D4Dpl2RNJdACbTvHUyHFTEdtuqeGndAz/Zl9uPfl6y/7/AYK5OXbvrWvWeKrIBKfvnQ+0V1kUHjqYlbrwuv+jBF+9jvFIDcfOLzpa6VPxFfDdpbO4ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392824; c=relaxed/simple;
	bh=7RqS4ISGXx337rqqvPNoI5WHXN20jmjPh3AlPaGp16w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n7qHZch95Ecs3nZBVj+dqCu+U498egfjys30YpzGkIDOcjHmSPXTbvJ0E74ujhZJSM6AtYCE9BkhfclzZ6OVssjGBIkUrKeVZ1smenxM195R0IZrXzSt3ggNlUSzDd2/UMe5hexajPXGPw7X63aT47er5eEUFcpkSD9VrnJhL7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=O/35tX7G; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="O/35tX7G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=ll7wsI/Em/Jn1sDgGc7GNu+RMvSzQcPU87sVEyRKPIs=; b=O/35tX7GuXF/+1DjOrDR+8DuZd
	clwUabfnWXg7PoWht4TLnZzlrTF6Bo6WFicrWHs4ue+yPICeMGPb6r48LMcMd93Jmuq7fkOXy+kh4
	ny66V1r6q2ck9SUosZ2A8WEbJnhH37IzGxEd6dtvkwyDeYF3iPCeVnZW4RyQGxQMEdfg+QF2jJlOK
	C/BEpGLVcARGzYyim+id3eNSgxnxk8HSrTzgKiVCkBYdgScpCdVRwcofrBtiWS9d2WvqUZgIwx0v1
	AnA37WpgzJAZUcGZY9ateRit5Bh30caPp2hqJhPgYOOkBSztLMKUW9wJdPQBLks9vstEpe6fV7/7v
	C948ogZw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wULV8-0000ZI-2W;
	Tue, 02 Jun 2026 11:33:34 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wULV7-000HOK-1r;
	Tue, 02 Jun 2026 11:33:34 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: tqma8mpql-mba8mpxl: configure sai clock in audio codec as well
Date: Tue,  2 Jun 2026 11:33:30 +0200
Message-ID: <20260602093331.1698756-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28019/Tue Jun  2 08:33:27 2026)

With deferrable card binding the sound card driver tries to
get the mclk configuration before it is setup in sai3 node.
Fix this by setting the sai clock config for the audio codec as well.

Fixes: d8f9d8126582 ("arm64: dts: imx8mp: Add analog audio output on i.MX8MP TQMa8MPxL/MBa8MPxL")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Set the clock source in the audio codec instead

 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 890d1e525a489..6b0f944095e7c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -609,6 +609,9 @@ tlv320aic3x04: audio-codec@18 {
 		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 		iov-supply = <&reg_vcc_1v8>;
 		ldoin-supply = <&reg_vcc_3v3>;
+		assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+		assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+		assigned-clock-rates = <12288000>;
 	};
 
 	se97_1c: temperature-sensor@1c {
-- 
2.43.0

