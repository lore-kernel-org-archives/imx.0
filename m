Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60BC2E6CCC
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 06:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760338764; cv=none; b=Ze5VjcGOf6ImHp2gDwCLVXdjbOuc3NbZkaYQkkUcYbT0LJuSmthE7kM8R4yhUTT8be+oAGfKeQE1akDlJFTgWP4O7lMd7uvnKxZHZbzp+13vf64umDRd+TWlP1lNKHwsd+cKElMACqYlxKvfbM/vSzwcqckjtlJs77XEk40gsug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760338764; c=relaxed/simple;
	bh=xWlK53CaSwa6hnr5xS+FvtF+Rl9CsmDftNxczEkSap8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E1SEGVDGiSu9Dlr8ecd3reMX2ZiMDnhtSCKJ4urEgI9M1RzYAWdblIE7MBKC1dEtQCryGz4V0hO5yV8SoGdrItwX8A6f4bDuzOMALlsT+0m4CUxQHxkWJLk8Vz+jLD2jI5XddckQs1jMmt2M8u2Ns7+O+tBSXqL+6yudj6lAySo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=rVTq/r+s; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="rVTq/r+s"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 0889F240103
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 08:59:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1760338761; bh=vdFSblBB+c7p7EwEPuHzEd2UFn5pK5CI5ZtkGJjeLYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=rVTq/r+saw25YvR8I4nYxqSrJIAt8Jwfg0NrcTm63W4Krooumov39yCewdAaffSXI
	 HX/pcK25ZRhuqZDNlbOC5Q3DA39ryuVYRXk70Qpiy538XrdRzJ/TTihYE0fcu58D4B
	 t/8je7qT0+9Ko7LVZxVROSiKjCafSojQgwQo9pkWtqG+Y5XdLfXZmFO0JUHBSDvvDJ
	 tuhBKf7isd9p/mi8wL4lobFQfWU/+hFPmZEN703FTHM+YXx2TxlBuoS8vZI2/1BSY6
	 N2vZI392CEri2ixBy8Rz/i4ijY2mh7QEX1gBI5DyanGuVEG9ZGTCM4zP8nrHadKElg
	 Iftd1IstiQ5vg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4clSrR5tZBz6v1j;
	Mon, 13 Oct 2025 08:59:19 +0200 (CEST)
From: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Subject: [PATCH v2 2/2] arm64: dts: imx8mp: add cpuidle cooling device to the alert trip point
Date: Mon, 13 Oct 2025 06:59:20 +0000
Message-ID: <20251013065903.35216-2-martink@posteo.de>
In-Reply-To: <20251013065903.35216-1-martink@posteo.de>
References: <20251013065903.35216-1-martink@posteo.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Idle-inject up to 50% of all cpu's time in order to help cpufreq
to keep the temperature below the trip points.

Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9b59f53952d5..7ab321af9e15 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -347,7 +347,11 @@ map0 {
 						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&gpu3d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&gpu2d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu0_therm 0 50>,
+						<&cpu1_therm 0 50>,
+						<&cpu2_therm 0 50>,
+						<&cpu3_therm 0 50>;
 				};
 			};
 		};
@@ -380,7 +384,11 @@ map0 {
 						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&gpu3d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&gpu2d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu0_therm 0 50>,
+						<&cpu1_therm 0 50>,
+						<&cpu2_therm 0 50>,
+						<&cpu3_therm 0 50>;
 				};
 			};
 		};
-- 
2.47.3

