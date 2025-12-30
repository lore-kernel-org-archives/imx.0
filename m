Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7A327CB02
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 21:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767130454; cv=none; b=pGZXK2wIPVfzmiCYuSFVuSliCxMb3fvT7cFo/mWgXeIKo/iyLczosMxCX5jOEqD7FXveesMpUHtP4gj3rlupSgXxMkNM9elANWrYzM6Q8QH8TORtxpNcfGrvpU4NUb58RSTcTj0lfM1VPHaWEaDRpdpARMlGb5C+7PcttOkByIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767130454; c=relaxed/simple;
	bh=bBKsE8uvXSTaX3UtsmggC4j0ead/gh5TVRkWv7yB2uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGqIzXZF1u6vd6kE7SgO54IXa01QeEGwPvnL9KB4yeYYzwa98VFr3mxs0ouZRbzbqGG6HhqM4jfJsyMQtHi4v9t+alkZUt+Awx7NmNDTeA0OIgAo8VJLLSDdYoxEY7D3FYwxcw0X/RPL4iYGWXBUA9HvRld+LvGnVhcL0mevdMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=C6LI/I4Y; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="C6LI/I4Y"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A09C10CE29;
	Tue, 30 Dec 2025 22:34:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767130450; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=AwfQeeviuskOGl0OQjUaScSQxcEU7XR0r6wDdLAwEz8=;
	b=C6LI/I4YjnFAHbxXgGnmQbzhS3aT5njl5ox8uTTQuiyoF7aC21W1BZ4F1goWtwBEHOgGXt
	oTnu4LI+Qbzw11zKeeTl8yAH7b51c2bWCloQIsGaemFPpKhJz7VFVHI/U4pmodf6gKqyXi
	Ewsk+gKE6p5Bk5FtB4c4bXDUeBQ7RZgl4jZ/eo/7szkYga+E/zusaz9Lyvq95veW6Oz3vt
	x5hcOxD7rIlQddY0c673/NmV38tT27tLNascDsHgQ3xc2K/p/rU8GM2l3JODqFS/P9esoB
	AVcpSYRhXuZzvOU9c/ZpegkVJeZfx7mBckyxO/zJmZkc0WB7lwqzaItJiXc32A==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] arm64: dts: imx8mn: Add SNVS LPGPR
Date: Tue, 30 Dec 2025 22:32:33 +0100
Message-ID: <20251230213401.219808-3-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251230213401.219808-1-marex@nabladev.com>
References: <20251230213401.219808-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add SNVS LPGPR bindings to MX8M Nano, the LPGPR is used to store
boot counter.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: New patch
V3: No change
V4: No change
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index b98b3d0ddf25a..3199bc0966b03 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -628,6 +628,11 @@ snvs_pwrkey: snvs-powerkey {
 					wakeup-source;
 					status = "disabled";
 				};
+
+				snvs_lpgpr: snvs-lpgpr {
+					compatible = "fsl,imx8mn-snvs-lpgpr",
+						     "fsl,imx7d-snvs-lpgpr";
+				};
 			};
 
 			clk: clock-controller@30380000 {
-- 
2.51.0

