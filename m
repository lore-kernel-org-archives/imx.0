Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633463655EA
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928541; cv=none; b=PRheC3sUkKEZLpwCh2JhBSp9uPGZhS85J0LjFo2HY0/aQRkjpOpZ4MCPws6/jmQCKBfElEUhcS6qx/fTAZJ0QaLSdocpCSV9isUWt8k3xbjHWZ11aZK0MO+AVS3icwLLoQYQV7eoZW9nk3wMNVd8tvOqc5dAC3lHE6/Z4JLJrC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928541; c=relaxed/simple;
	bh=lDVfV0skgc/ApNInDKtUBUGTmyRgFFC24S0LVIk+hgU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=JA+YO25rTCSkJEgCkYCtry/Ikl5bZrK8avxGT32zi+Fyakfh24rW3kwrgIe4SJTdMJP1ndS0d5IduB8Pp5mHuyExhbWyCjVNIBePB5hgDbweYl5prp2MVG90vHKzbmjFpc5rqLznikmqS/JNs4Gaiws+5cu19GK2JNJkj31eGwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rwZx25YC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rwZx25YC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D4F294E40D82;
	Mon, 13 Jul 2026 07:42:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FB2460341;
	Mon, 13 Jul 2026 07:42:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C3BB11BD3A38;
	Mon, 13 Jul 2026 09:42:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783928536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Oo4rIyniLa3IrOryYngEBRNx17hUDRIHRdfHv96/rA8=;
	b=rwZx25YCNBbEgGMtX75PvBzTlm1s61DtQzrE3ZeCtVUl+HzTfcVlC1R3kee22hR6JxcP4E
	S3NHkHLMPJkNknT6TwRDk8lYb4JH7a1Gdt1aeoUKgZdr8pu6BKAzBxidM8F5cVbGcq5+7k
	sBHcdsSB3CSzMIehKZC2UhNhCuFMt5mrMe38z8O//+6o7W0BYRgTBrB08dKDhhVO3FMlRs
	lvZiq1KqYKZPN1TYbDcDrG2ReR90cWcSpHcDMr1qND8rUhSB0k6qIbt55eV+gS0JZrfimE
	mMqD4zYxC3rJjeF0zrGAf5Pv8MhPZy8xWXc1dZwt2LxqIGaHiLW6uL3CLbRkXA==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 09:42:05 +0200
Message-Id: <DJX9VUXFJBJ1.3SPE0QKF0528B@bootlin.com>
Subject: Re: [PATCH 1/5] arm64: dts: freescale: Import optee node from
 u-boot device trees
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Wei Xu" <xuwei5@hisilicon.com>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, "Avi Fishman"
 <avifishman70@gmail.com>, "Tomer Maimon" <tmaimon77@gmail.com>, "Tali
 Perry" <tali.perry1@gmail.com>, "Patrick Venture" <venture@google.com>,
 "Nancy Yuen" <yuenn@google.com>, "Benjamin Fair" <benjaminfair@google.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <openbmc@lists.ozlabs.org>,
 "Tom Rini" <trini@konsulko.com>, "Peter Robinson" <pbrobinson@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Frank Li" <Frank.li@oss.nxp.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com> <20260710-mathieu-uboot-dts-import-v1-1-ffe0210e50c9@bootlin.com> <alFfeOFz2UA7hAbK@SMW015318>
In-Reply-To: <alFfeOFz2UA7hAbK@SMW015318>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jul 10, 2026 at 11:09 PM CEST, Frank Li wrote:
> On Fri, Jul 10, 2026 at 05:31:34PM +0200, Mathieu Dubois-Briand wrote:
>> [You don't often get email from mathieu.dubois-briand@bootlin.com. Learn=
 why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> U-Boot is importing kernel device trees for these platforms, but adding
>> a firmware node to enable communication with OP-TEE. Importing
>> changes here will allow to remove these additions in U-Boot.
>>
>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mm.dtsi                | 7 +++++++
>>  arch/arm64/boot/dts/freescale/imx8mn.dtsi                | 7 +++++++
>>  arch/arm64/boot/dts/freescale/imx8mp.dtsi                | 7 +++++++
>
> Please split soc dts change to new patch.
>
> Frank
>

Sure, I will split the changes.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

