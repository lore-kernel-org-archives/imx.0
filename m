Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771636;
	b=yZku7gD6/Yetfk6W+7C+Nc+xYh3D7Jj4bTvZ5rZhxKqNt4yry3AI6o7P1gvot2sr3QQn
	 rkLIbzrnS9o2Xr74bTNnFJVU6vo5uZuZsqIh7z2UJzIHeAPTRdWDNIWpucBBs0dE4SlVO
	 EjiBp1giChUp0BgDOiwERXAohP+QDVXVJu87EVcor0vXhOeqZauRMfgIn0O5VuqeFAtdo
	 pM0r9dTlcTa3nv35F+N3RiZIaOkviYYW37EY6emG8Efrwt0u6v/7bRDwJD7tfOiFaFVeT
	 dzUE+DDCyWpPz9PMWS7sJ+Azck6GTbCloRDfcFvSXevZkOXlZlI8sjbnh8AAl4kzJjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771636;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=o20Chm5YYzyaeShfBE58QenD/TWPt7pCsFjGMWvzNHA=;
	b=wWcLIwcyDFADgvm3r+MNyNbCBTpQSqhwU7chnF4KY41uj/mdYM3+CnDXCzpjlBhAciXK
	 VVcWxYsYYjUXptRawwWM75RVZiWHeXakm2K/aHjayAtQgoIifdn29iJm2+R+nrI4Aznd/
	 tVXkWIlolvpnJfEU9+aw8zrzFgcsCafcR3mMepw7mukTl43WBEG3Qgvs7jXloFLPEYGov
	 guhQJ8x7Cj4hfYTrqGT9nAchJbNxsR5OhRfLY1y/2HZq9rjk4EZqjIsK8grRScWiGBMLF
	 xLHfEJJjJkrRLhILNPATzTByUG5wlbwqnATV/VziD11CFboTDPFCE9lsPVOqrhXZt8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=trvrwwFz;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5729F606A330
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 09:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5729F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=trvrwwFz
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C9BED4E41795;
	Fri, 27 Nov 2026 09:27:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95EA86049C;
	Fri, 27 Nov 2026 09:27:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F000911E68208;
	Fri, 27 Nov 2026 10:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795771632; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o20Chm5YYzyaeShfBE58QenD/TWPt7pCsFjGMWvzNHA=;
	b=trvrwwFzIqo2mUgfCxEptebF7FC7y/AzHQOQ5RYBZaN48jnVYFsV/W4buUoneXleDhApJs
	vKj9Tb5BKKmMalB7t0LOb41kEqiwtLp5HFo9hMHopgo8OqljYBPJuJMXa25LEBh2INj+va
	DkmJxqNVBnIGI8opMsNR3eDy74fDKL+2EeLWr6H0DM2XZALMh206vlO6x0vp1kyX/JY9PH
	8UCnxY7D6c2rl2LrUicu9sNjUDirGuGp7ZgEUq1NLQNRX2kA6b7NyfK1tU7raQHJThee1E
	arIMOI6DDxRJ6iZD50GBDIPaMPaJ3j0kNzryMJKcEwlN/XLan7X4jHmV9lykbg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bough Chen <haibo.chen@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>,  Liang Yang <liang.yang@amlogic.com>,
  Feng Chen <feng.chen@amlogic.com>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  Han Xu <han.xu@nxp.com>,  Conor Dooley
 <conor.dooley@microchip.com>,  Valentina Fernandez
 <valentina.fernandezalanis@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Haibo Chen <haibo.chen@nxp.com>,  Jyan
 Chou <jyanchou@realtek.com>,  Yu-Chun Lin <eleanor.lin@realtek.com>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Alvin Zhou <alvinzhou@mxic.com.tw>,
  Cheng Ming Lin <chengminglin@mxic.com.tw>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  imx@lists.linux.dev,  linux-riscv@lists.infradead.org,
  linux-stm32@st-md-mailman.stormreply.com,
  linux-arm-kernel@lists.infradead.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 10/16] spi: nxp-xspi: Consume dummy cycles directly
In-Reply-To: <20261127090720.2zu37yavojz7fze6@shlinux89> (Bough Chen's message
	of "Fri, 27 Nov 2026 17:07:20 +0800")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	<20261125-macronix-upstreaming-spi-mem-cycles-v1-10-fd036402fd37@bootlin.com>
	<20261127090720.2zu37yavojz7fze6@shlinux89>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 10:27:04 +0100
Message-ID: <87tsl2tyjb.fsf@bootlin.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

> On Wed, Nov 25, 2026 at 06:51:24PM +0100, Miquel Raynal wrote:
>> The spi-mem layer is now capable of providing the dummy phase in cycle
>> units rather than bytes, provided that drivers advertize the dummy_cycle
>> capability. Since this controller is consuming cycles and currently
>> converts bytes into cycles, flag it capable to consume cycles directly
>> and drop the extra conversions.
>>=20
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  drivers/spi/spi-nxp-xspi.c | 12 +++++-------
>
> Hi Miquel,
>
> Can you help also add the changes for spi-nxp-fspi.c?
> flexspi and xspi of NXP have the similar driver structure.

Yes, flexspi will also be part of v2. I would be very happy if you could
provide test results for the NXP controllers!

Thanks for the feedback, I will send a v2 soon.

Miqu=C3=A8l
