Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABDB3AA510
	for <imx@lists.linux.dev>; Tue,  6 Oct 2026 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295177; cv=pass; b=aRwXs4BDqn2VdTy75Mgo9lv4p7n3XxmRh66zeaNBDj+AxW/1Z9XA8fL/6kiXOW8ua22dnPzRPvpkpnDd8GdTjeijcXWzvVdWyniui0dnDB98dlvFBklDmW7Cj6DlR5+ZqbUcukhVt5don191TzQl77JPgud/QMGDxVDW4XsGChc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295177; c=relaxed/simple;
	bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o169/yo1M5z0on3f/R8ALDxif16qm0c+d6hcFGLm+WqpyCihNwcA91J/X5uRZIX59VkggojdK16WUTlRrJ/MnBq2EMgCglvIhqRpflBK65hrKgDGyWGCY1fKP+rpFzvH+V1PCKnxDvfUbWh0i3ant6fp+vz+eCLeGfDaXor8BiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ59hkoH; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ59hkoH"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso455875e87.1
        for <imx@lists.linux.dev>; Tue, 06 Oct 2026 06:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791295174; cv=none;
        d=google.com; s=arc-20260327;
        b=WyJLNEWiZtFxr9x8qbTgT08m1ei97TRE8GARhEIaN85jkrv/N962CfrbK+G1AdKUjF
         TEt+58HyAM7ft9w3M6luzqB0nLuiHTrL0c3umQr9PbtdprSuJAcRPGawaQc26O+BqBYY
         OsSf3EVpGjf4gRoIsbmazhOirIkcu8w0F8YmPDSnXS5AeOSuOSCcn5AQysiewPH1L9Cd
         jr2RV/N1X4qNMaprN4aA0x+7u2ZulU5Hh4tB+j28qbDmqYashVxxso0/09jwXnma3uq8
         dn7moQAv3iGIVTRxTdHr/yAuOkS4fpvh+9qKFtCTW0ORdW/x0MGqJDMO6tAEZzIPMGUY
         rktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
        fh=WeU1GQoXa2L9JiGNexxpzry9f7toO4zkycCC7IEGGfM=;
        b=Th/lDvrwOdsd6/X09dG82l2dGDqrcRiaDnbG3KlFJRVq39MmxS/+McEDQMBTlcG9x/
         ACyiH1zUV8pMfY65pySV0yddXeMHaE7L7MII9crgjwfSKg8Ov/YQiA9lRyiCanRtC4wJ
         CZ0vYIzfxyj/1EYJgUS/DmdTaqhcLbmNnbpmXI1yMjuec5OXly71Xlk1MmIP392c9p5y
         jHGpKEMYxdTUAK2UPBGtx+IdCHVgmS+eU1D9rjHkB2XR4XysWFXMJfPGi6ihm9ibiOZ3
         wShJYpet8GQhxDksEC+79ggphjZQyYRAYUw8/aSlkvZ7YC4zkLcxV8M6wToyh5uF3BSl
         vQBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295174; x=1791899974; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
        b=lQ59hkoHaFpTNBqD53iVT4yUOpf/Htp68FzZIS5Hab5h7NlGDfz2bYfW/qED/SOsFN
         37yIiRIUIpA5ymhD540G/UnJ6xFMY/jqX0N9mKVvVKCGtx+KEO9vRMdkLIGcLIc/WL8z
         PETnts4ba/7nTAnHmPMMyKztC9KEXxvNSEBKIvOFDXMROM3G0hS7Lcd60qElQ4no0zXo
         fCUEJbSWHEpBfAX3NGmYdc/mlxvBsg/lNA2V2KWbsVqm9nspdDKNzlKWMq1R4Gci7vKw
         dKLbwXW7bg7nzv2D9Hs8Qb4Sl55F/LXlkN9bKkg502TCNVLq4X9t4C3GvrToSyFjSBy3
         FMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295174; x=1791899974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
        b=ezATaeHnaf2cx7AgbWC7/13ArS4tScNQEemmhagjH7FADfOfE1jgFG0d9nk9jhTB/p
         NqxsnsKiXV3l1SUHPWAFCMyTT7AMbbd19GpzISwzQjaZNvMPSpmkarYF0b+Y0sujMByO
         SqPlz19CiSKOYCyvXYlkBK9teo2TWui05LMQaD7vgrFznseY5XY3FaxbCkdSDj7mmtCH
         iDhZFT4YyIxbNyKW+/qEptchdTNKs9DcIgpBM+nzI5hUrmnc0dMzLwIij+jMmsJHGXbY
         eNzBis4DqTLZfopvRHpUP0Os4f82FsYvx0zf5+dT0q0BV+Hu24/eJPziiqcviz92hxPy
         P8mg==
X-Forwarded-Encrypted: i=1; AKwUvBzvUW8G7EjsyJEFwE0t7kIadocf2QQPdJ8htGhYkj+r/RE2nqt1Kh67cU2RbfQk/UVgAQ0=@lists.linux.dev
X-Gm-Message-State: AFq9FYIIkqCpF/oyyGMcrgV7MCHhpjA18Dw2LnuiJZv8IUWVDzcg8E9Q
	LmyN9Yiz6Nqp2rqeON9/5noiIPByNnraOB+iLRtD28DYg7Wjneta3OYMTnYhtmEd7G/4FwHQkrp
	7ODMbnyz+ieSh4/L+CA1lKP2jF4Ua8SY=
X-Gm-Gg: AYBFou3wXXEgHgjv5ckAEgvEJUAmT3SBFE6I+jBT+khV2KdGmB1/J8xGVTbuFY8xA6+
	WuGrJh5fBTUD8h/RRsoZFYKB15w+o5KC59I4PsdxwtsbTt9MPKLl85SIfZR9WcskIrd/9+fxBwT
	aO9YLi9seuTuRtEWMDM16Ia4tAadVxloJaeda6cyjz9MaL8THp1S1ZJ3uH4Fs3jKEYpOOhcE1fN
	cFn40PTH/uME/xy8/JA8qaIeLIbCy3ASLSV4nNzox46rmMwRn7hLEkSLe6GqvA0c4CgLZeDz6bo
	C+TUuGwGZv1FwGjBFz9boAtNg/Tq3CKMYgs8YJALCZgEKnlZTyafLIG6MY8xp07hpls0p+e9QIG
	mzghnY8KQZKwrsBFABh9XUjVA2vp86tsKv2uW2arTtGo=
X-Received: by 2002:a05:6512:3b14:b0:5bc:b659:2d99 with SMTP id
 2adb3069b0e04-5bccc6b4c21mr705952e87.1.1791295173932; Tue, 06 Oct 2026
 06:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
 <20261006132512.2246196-2-alexander.stein@ew.tq-group.com>
 <asT7yvlCeQl1rfrS@SMW015318> <5021357.mvXUDI8C0e@steina-w>
In-Reply-To: <5021357.mvXUDI8C0e@steina-w>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 6 Oct 2026 10:59:22 -0300
X-Gm-Features: AclHuK-G83UF_cmuikg5GvtRML0WChn-CSBfbzHsfZjgKlTszPVDr547oglwPQQ
Message-ID: <CAOMZO5AJiSoFb5Fy-LR4=MDqQqhJPvtzLT+-18es8j_HvYqt6w@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: imx8mn-tqma8mqnl: restrict clock for
 SPI-NOR flash
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, linux@ew.tq-group.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Tue, Oct 6, 2026 at 10:50=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Dienstag, 6. Oktober 2026, 15:46:50 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Frank Li:
> > On Tue, Oct 06, 2026 at 03:25:10PM +0200, Alexander Stein wrote:
> > > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > >
> > > The FlexSPI controller uses quad SPI with internal clock recovery.
> > > The clock is therefore restricted to 66.666666 MHz according to
> > > data sheet.
> >
> > Which datasheet? I suppose NOR flash datasheet, can you provide link
> > here.
>
> The i.MX8M Nano data sheet Rev 5 09/2022 section 3.9.1.1 "SDR mode with
> FlexSPIn_MCR0[RXCLKSRC] =3D 0x0, 0x1, 0x2" Table 55. "FlexSPI input timin=
g
> in SDR mode where FlexSPIn_MCR0[RXCLKSRC] =3D 0x0" lists 66 Mhz maximum f=
or
> "Frequency of operation".

From the commit log, I also got the impression you were referring to
the SPI NOR datasheet.

Please clarify that in v2.

Also, shouldn't all patches in the series contain a Fixes: tag?
