Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541135;
	b=4Loq0Irq62P3je2zIPPJSY/k7GWWl2YwhPabpKouDAglHWnMmTVIsZUhfeqRVT0shq3e
	 Zxd4IIeOrS5UEFyLJYcAx1Gbvq6bS1XlrpsMdKbbYpLVKsTdqHOlwiHOm5P+LHFVzOsyZ
	 omi0YqL04EBas2CL84fMTbF/h8S91IAt5kjWlCJEjo+4YS2RVnR/Z419UiVsBeDjqV1wp
	 e+DZFB7eK1zgWw21G75Qr843PaIbCzyhyTbHQ7JOXo8AdlWfkYIM3sPUAwMhneofDabOB
	 BSgLAaVRCtX3dvaHy8WNNVtoRKUT3nNi5TdgWBpRaAIW9X3DPwmWjaglkXDh9tIW+fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541135;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=r4Faf5+FEQd5QxFogS3mSEI7ecco6F5hpn/AXn7fsnI=;
	b=Y0RFlUVuxrcdttqONmKFle0j4/Xdh336XvKpUAWdJk8e8QXPd3o8JpsYvYnb2N8ju6k6
	 ohFBBy1tyIlaR/9oXJX0ejVMcJtOBjt8HIkWT8MYatsL2aTdeeJIFyXTRMHS7/VMPhjON
	 D6ngm4GxWiGB/jJD5k6p+qlc0H3sIMDwm49jeVygSUvDjg0DWOVsc5qwNq/C7wOMlO+DI
	 Ewwrz/M+mGp0Uc3FGcqV2T3AwbR4oL9h97IpZGvmZ19TsK9VW0+Rx2sPvhPrbvxdtBFsw
	 Xsdt4GUsx5GZVst94wdz8xCKF3pqk7Jav4bxiKgbAZDDmnk/nqQ9MOkF9HZq/gC8Xlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JMZ9D0Lk;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCFB606A321
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 17:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BCFB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JMZ9D0Lk
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E8E4AC2C66D;
	Tue, 24 Nov 2026 17:25:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F72A601E1;
	Tue, 24 Nov 2026 17:25:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DD4611E69A47;
	Tue, 24 Nov 2026 18:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795541127; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r4Faf5+FEQd5QxFogS3mSEI7ecco6F5hpn/AXn7fsnI=;
	b=JMZ9D0LknlH0UnLwZxj6QYZgAZ4twiMCjrTs86rFZNF9Nrj4dlRaYLikv93yXSSsPoFUK1
	BIPBs4+9nsD40YBCpHK8z3aviduMYzw2WKYTP/XkfZUpXKaHF4oRLyzCsLijmhUSGs+agx
	5Tj234xLa/jarQUHJWNYYDNGh7s5FIF81vNlcQy+AwGDj3D/4NpsUJYLzBS/oBTzOoHzgC
	sDLTAJAwKOIhCr997/uw2hPJysFdfi2OfuolLcJSHEsDR1ihfCcBWbLHeIqsTzwNm8PoXx
	VmlibIMAn9wjoBOND/AIZ2n3XPRnVjkdLOzCpjYgBh8Rzw6VXIBHk0bFDW5YTw==
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 18:25:23 +0100
Message-Id: <DN3M7GTHXWPH.3QU65NZ86T85A@bootlin.com>
Subject: Re: [PATCH v2] drm/mxsfb: lcdif: Fix use-after-free on unbind
Cc: <laurentiu.palcu@oss.nxp.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <marek.vasut@mailbox.org>, <mripard@kernel.org>,
 <stable@vger.kernel.org>
To: "Fabio Estevam" <festevam@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261123223357.535424-1-festevam@gmail.com>
 <179551300942.327856.7174455040291936744.b4-review@b4>
 <CAOMZO5ALfN-zGZuVn7tm9gpg+1yO1tQGKt+O2NXem14hbr+_6g@mail.gmail.com>
In-Reply-To: <CAOMZO5ALfN-zGZuVn7tm9gpg+1yO1tQGKt+O2NXem14hbr+_6g@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Fabio,

On Tue Nov 24, 2026 at 12:18 PM CET, Fabio Estevam wrote:
> Hi Luca,
>
> On Tue, Nov 24, 2026 at 6:36=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
>
>> I'm OK with the change (except a small nit, see below), but I have a
>> general question: is there any valid use case for removing the lcdif, ot=
her
>> than testing?
>
> Yes, the motivation for removing the lcdif was to help decrease power
> consumption on an i.MX8MP board.

Uhm, not sure this is the right way to save power... This driver implements
RPM, so in theory it should not consume any resource except allocated
memory when probed but unused.

Did you measure to power consumption in the unbound VS probed-but-unused
cases?

>> No need to use the @ret temporary variable, just replace it with:
>>
>>                 if (IS_ERR(encoder))
>>                         return dev_err_probe(dev, PTR_ERR(encoder),
>>                                              "Failed to initialize encod=
er for endpoint%u\n",
>>                                              of_ep.id);
>>
>> With that done you can send v3 and add:
>> +Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> +Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Thanks for the suggestion. I'll send v3.

Anyway the v3 patch makes sense, added it to my TODO-apply list. Thanks!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
