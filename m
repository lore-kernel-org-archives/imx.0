Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE56815358D
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 16:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712681082; cv=none; b=u9YluQKtN9Z6936Gu8qZYL08zHHVQUHH3A0PrEqyUgJ+j0G3/Uq/zD8Fb+oK7hbB9e4FsJ9dr28aKk45xa8824MnWsBAtDv2o/kMjPL6h5A9kFfwZylhi8Tc2ZiiNjTV1Sr5scBwEqhCUdbGjoSfC+NHHG+ubHtNWgdKQPJb6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712681082; c=relaxed/simple;
	bh=39YyZmAfdf4vHb3K8iCAxVV01Zal5LvvE4zzi2uoc7o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZOG27ZWpauDiRZTV0QhNw1vSqbbebo7qsYPVJA0yFkV4F7i454ttTdRgW1ffXDBd3r9AW/qo48MpyrwiwWwcdNhiXiUrqx2UlBxTEhlE4v80vE8bOhqXkeYORidY5P3/1BRgQ7Gk6WK/IqwmWsV9Z1Wj5knVcVVXYB9XIu/sayg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NA635d5N; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NA635d5N"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3455ff1339dso2090709f8f.0
        for <imx@lists.linux.dev>; Tue, 09 Apr 2024 09:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712681079; x=1713285879; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=39YyZmAfdf4vHb3K8iCAxVV01Zal5LvvE4zzi2uoc7o=;
        b=NA635d5NMNZSTo0d/F5TXwfg26Z3rkMPstSZwkN2pVE9E3fishAVjubd6K6Nl/kMXW
         8r+iokTvc9oaRCWo5Prt+cYJXKxyO4aBoc56bZMtcHuk+ekGLR+rgP/RaWKMubZb2WcJ
         wE5JUuLXaSd1sx4lan2OYRlxnlkEFIGyvVDI58Em4rj+cOWaCxpTkGBUhrVixPOVON/b
         rAX9i3Y6U0ZYAzxY5OHa0T3td5kOOZbePdSNLU7wDEh1mDOQtUipLmSMOAbIfEQRah8v
         VduPfaIQjYLJBoGOBzP8qDoyRgcu36GY8QLhIYeMzPIpwIzb8h9JujkbRdoW5Uhf0OuJ
         /7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712681079; x=1713285879;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39YyZmAfdf4vHb3K8iCAxVV01Zal5LvvE4zzi2uoc7o=;
        b=AmRXP3gWnrql+y8Z54NIdpFf1acxcjyfHOsZSmR6RrmaXX7bhzAsDKb2EL1OrMOChm
         FZ43Pf+0c4EVLOQeDttPydo+GkzjiWoDkKPsBF7cjkCSeJKDqtDznG5anlOOfqx4jtCS
         msWw0A1FmG5j79F1fXfmikOqMQwEnG0fgr56Ny0sNhuXq9CeGlhKa6EjbPObL79FDapo
         9NNQ/gCN0ZuggleQd9Z7YX/oDho43ak2vIv10xLu13mOV6a27+39+sJ77Fz1uL72Uw3u
         HlLxkd1yB8AMWlrRiQNbvU9p3tDjJBspqQQC0HZCNjNekIEMtA2wgZMXOjIMaPP+nJW2
         mISA==
X-Forwarded-Encrypted: i=1; AJvYcCWRn4VX8dMHtfNw0IG38nwNpGVIPGx5ya3VjxrS4BGfajlkjSbAqozcb5ZyXqxyY9hmhFqLNUbRr8qIP3GKJsALjFYs
X-Gm-Message-State: AOJu0Yy/jgjaMVEI596mQBbLHQ1AUvWX0kgPb2KpLGiNUMlzh8pAjH+1
	kN5u35C4kkr0eo3nqVrrLYkkCcQ5rQgOLn81s8UVYgtJONBgn11L
X-Google-Smtp-Source: AGHT+IG9oCRp8KNYrcpRgvkxjASB4B9j7CiacUqJAP6Fnj2ZHjCz12vzOT6sXYOQlWJouTexhhWtPw==
X-Received: by 2002:adf:f3d0:0:b0:341:8412:a6e7 with SMTP id g16-20020adff3d0000000b003418412a6e7mr188242wrp.18.1712681078763;
        Tue, 09 Apr 2024 09:44:38 -0700 (PDT)
Received: from ?IPv6:2001:8a0:e622:f700:5844:d7c8:2851:cad9? ([2001:8a0:e622:f700:5844:d7c8:2851:cad9])
        by smtp.gmail.com with ESMTPSA id e27-20020a5d595b000000b003445bb2362esm9308419wri.65.2024.04.09.09.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 09:44:38 -0700 (PDT)
Message-ID: <bd4d7198e58bd89b46a4c721546f6975b287a5fc.camel@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: imx8mm: fix missing pgc_vpu_* power
 domain parent
From: Vitor Soares <ivitro@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Tue, 09 Apr 2024 17:44:37 +0100
In-Reply-To: <fcd6acc268b8642371cf289149b2b1c3e90c7f45.camel@pengutronix.de>
References: <20240409085802.290439-1-ivitro@gmail.com>
	 <9ce35b9bb5a15891f6bd01bd54b7dc84b3ba4021.camel@pengutronix.de>
	 <e1552a3008a30ef7ed9097b4b80cda23ccb9e840.camel@gmail.com>
	 <fcd6acc268b8642371cf289149b2b1c3e90c7f45.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2024-04-09 at 16:36 +0200, Lucas Stach wrote:
> Am Dienstag, dem 09.04.2024 um 14:22 +0100 schrieb Vitor Soares:
> > Hi Lucas,
> >=20
> > Thanks for your feedback.
> >=20
> > On Tue, 2024-04-09 at 11:13 +0200, Lucas Stach wrote:
> > > Hi Vitor,
> > >=20
> > > Am Dienstag, dem 09.04.2024 um 09:58 +0100 schrieb Vitor Soares:
> > > > From: Vitor Soares <vitor.soares@toradex.com>
> > > >=20
> > > > The pgc_vpu_* nodes miss the reference to the power domain
> > > > parent,
> > > > leading the system to hang during the resume.
> > > >=20
> > > This change is not correct. The vpumix domain is controlled
> > > through
> > > the
> > > imx8mm-vpu-blk-ctrl and must not be directly triggered by the
> > > child
> > > domains in order to guarantee proper power sequencing.
> > >=20
> > > If the sequencing is incorrect for resume, it needs to be fixed
> > > in
> > > the
> > > blk-ctrl driver. I'll happily assist if you have any questions
> > > about
> > > this intricate mix between GPC and blk-ctrl hardware/drivers.
> > =C2=A0
> > I'm new into the topic, so I tried to follow same approach as in
> > imx8mp
> > DT.
> >=20
> That's a good hint, the 8MP VPU GPC node additions missed my radar.
> The
> direct dependency there between the GPC domains is equally wrong.
>=20
> > I also checked the imx8mq DT and it only have one domain for the
> > VPU in the GPC. It seem blk-ctrl also dependes on pgc_vpu_* to work
> > properly.
> >=20
> > The blk-ctrl driver hangs on imx8m_blk_ctrl_power_on() when access
> > the
> > ip registers for the soft reset. I tried to power-up the before the
> > soft reset, but it didn't work.
> >=20
> The runtime_pm_get_sync() at the start of that function should ensure
> that bus GPC domain aka vpumix is powered up. Can you check if that
> is
> happening?

I checked bc->bus_power_dev->power.runtime_status and it is RPM_ACTIVE.

Am I looking to on the right thing? It is RPM_ACTIVE event before
runtime_pm_get_sync().


>=20
> Regards,
> Lucas
>=20
> > Do you have an idea how we can address this within blk-ctrl?
> >=20
> > Best regards,
> > Vitor

