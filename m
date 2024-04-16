Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5567E134CE0;
	Tue, 16 Apr 2024 19:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294492; cv=none; b=pvI3WK78I85WO4CSA6tXAAxxvl1BnPwpCL7LSmanjoEuoLYGgHjfe/YqpKay/XKsZ93hOmzyQyn1coIo0cv9qKud5/Qpliq4tvJfg8KqqZNC20DwQlN6WRtGQtvUdSpIpv4xL/xNITO7TD5XUJfayNGXCmIaFN9zHX6qGJpEt9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294492; c=relaxed/simple;
	bh=ONM7js0UsEioCIsIWdDlgL8nKp4nm4tHUrOq1i26068=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m/aNsP2VmOYYdPZJ83RLkcooaBFGwxEpJw15BhhuU36gMnJ7LFgbl1VV4H9PrndkAV/iLnzgI4JfwycoMWaiuGp9B8sYZHv0wzKpIXnNVA5LRtfFHfLE4/Afyh3oLMf9+tcKzkXEuGHdfPUnGXPeKdXq2yDMWfPF4HijF5kzZM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=uG15JyPb; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="uG15JyPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713294452; x=1713899252; i=wahrenst@gmx.net;
	bh=jC8r4y3AfFoQsNDpNzSnkUGCOZhI0Day5D2F4Gf5Xro=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uG15JyPb2SSJ0rlfpyUUv+bl3ri23T8NR2BXgAYJ6U3jUNeEzvw/5vgU7HNuRbrK
	 cJEZmAZvWKjutxQLJ1ZFBqMfUyzoyChHMqXMpCiMPsGgFxArP3VQgoU8d/29hUIM3
	 hNNl2a+QB1AvJ4mz/K+YCuQrJT7GMCWN8FvuvLkWhJopXrXE9/3fXa67h+4kEDbor
	 bv0psWEs89Fkjm4DpRz9W18Ca0PGAVlr43oANL81N8YnDZoxMqEt3xoiighlcPvVx
	 11y/Oho1np3hjl9JWUPh4Z4keMQJ1ojgAX+jjj8VBgexf9bLfgis4qXqBChggA5Bl
	 Y8xk6jt5spNXEJX82A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxlzI-1sf9ha26r0-00zDRq; Tue, 16
 Apr 2024 21:07:32 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: kernel@pengutronix.de,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Heimpold <michael.heimpold@chargebyte.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/2] ARM: dts: imx6ull-tarragon: fix USB over-current polarity
Date: Tue, 16 Apr 2024 21:06:58 +0200
Message-Id: <20240416190659.15430-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416190659.15430-1-wahrenst@gmx.net>
References: <20240416190659.15430-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iU5Q5yT8figHDhKZ0bNQItKWrDerod+Bl5JHHypWpRMkB5BhhIV
 FiH6PWOPlINlCDmZ51U+wCW7n+v1xRBnSTYIDHybyicWf9o8IheXEEQl5Aw1pWYl5dKtWCz
 bCw4+vV3FMmrhbGZ4fySZNKHLX9hieB/2ZFqspNjvFcGOyoe8LQm0TuzPEIMMdDidgz4UXH
 sPEjDLzHTrwgn4qnx2gww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Qp7tvBErl/E=;c3gb6dQ22ckJFv70N8untiLFfW2
 pCtIsXotQN8EI9SNzWeJo12q/I4tm3vW1/gCaM+uImq6Wtt0+AkbDn3GL0JE5BeYy5ji0iepX
 4XcMbaH3k+ibaQYsgKlV3WjLW+3V8WQUI/NITN6ZRvlaC7BxWh4XOd9HDUY0kEiO2XRkdshOW
 7REd2lfh3b0HunaL4eL4P9JE79STV4qb8MbiaPCfJLzDHfiFpkcZ0gZJjLhnVhDl7Fna8HEP+
 ZrGWDB8nhsF/RtHXTTLI5/R3L9VLjc4p1mm40oGbNr1LWSKc6Ijf1fsIPX1kvceHinEJiElWk
 lLlo79fSjX7vMCJnCVoobjuzRSxkVDC1d3NbVmmwy05lknUA1XGKDGOPEERrqb8dUbTP2kgsL
 Bgmnhr6XUW2d9eoBSg0RLn9Rnv83jUsM03s0TcMJwvPnEBCza5ayOiyEHaJFWf4Iz+Ia/NBFX
 BurMlUGVwZjl9DZ2jEstjg9S51Q3aO98ki5eYVIAJxT2kjZR6lEL0Ql3ae66L6fdnjjPEWjA0
 qEvYhZy/DhpPUNdk4KJQnO68Xbq0vwGL+cQ4YbpfKV94f583FqnFFd/qMd8/B/xc6u3Aw/1io
 NOvvD22RX5PUxA0X4XTmWSTFjUMpEXxOn41xkljJxgv2ABdkKN4WLGjhFGLkPFYlSgl5CWpIb
 hVouNut4DIJoEsZ0mtvGvyGJ5ZZtZNo+A2VOk76OpxSnbdb4YLaQ14aJ3ZCQvEEe2NTnMxJM7
 KKzB/2XbxWV//omqsKQbNwHCS9N35wQjqNegJ4UBOczzNpy3KOm1UMCKiXFBAavV2tF/MYNZC
 NNJdRf+vQiJ8kLdVznbeWmPO2umds1M5vhU+xH0nBH08Q=

From: Michael Heimpold <michael.heimpold@chargebyte.com>

Our Tarragon platform uses a active-low signal to inform
the i.MX6ULL about the over-current detection.

Fixes: 5e4f393ccbf0 ("ARM: dts: imx6ull: Add chargebyte Tarragon support")
Signed-off-by: Michael Heimpold <michael.heimpold@chargebyte.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi b/arch=
/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
index 3fdece5bd31f..5248a058230c 100644
=2D-- a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
@@ -805,6 +805,7 @@ &usbotg1 {
 		     &pinctrl_usb_pwr>;
 	dr_mode =3D "host";
 	power-active-high;
+	over-current-active-low;
 	disable-over-current;
 	status =3D "okay";
 };
=2D-
2.34.1

