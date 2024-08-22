Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CDD1C9DDD
	for <imx@lists.linux.dev>; Thu, 22 Aug 2024 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724331594; cv=none; b=Nb0zvPS+K31aDf6lAFD/KapBZ4DfxmoT4sN7Mb12ooiSB0qc+XKzbjJDjYlIXVvMIm3IuU1LXcjhL2DsE26TMRljArMmBrrArhcA9GJhhrAYtakSVSLipjMqLcieBf2lPTT2XLn5saScLiLQdKHrvlkZcsIyq2ZnS+7KPBDwMMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724331594; c=relaxed/simple;
	bh=EoO4sCNWaPPWmdIdCr2gmgPkfl+OMgV/V6faIdi9Nng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xw3g69T8H15iNclaOacCzLQUn8aNW2isevgWO2EHxgtei0+SUmh3YMiMxMIVsXV7UHQToeEYcDtJXGQPQEega44iKjaFPLAguuvGzfcplmltJE350ho+H4o6gg33Jm7TM0gvW7YIgUZk6FyvKfAZBEXTIYhETUFWSrQ1kGVIv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFqdMRHh; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFqdMRHh"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-533496017f8so1091802e87.0
        for <imx@lists.linux.dev>; Thu, 22 Aug 2024 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724331591; x=1724936391; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoO4sCNWaPPWmdIdCr2gmgPkfl+OMgV/V6faIdi9Nng=;
        b=EFqdMRHh0V/O9w3wk9nsk2n7JYBoo9Oh4AqJ3t0miAdC0H2mAkmd1wI31t2/SFfYwi
         3mUZBebSbiaeWWd9ETpAFxN7ZZYrwcqBo6GLh9yBRuotdxxMycaSJkTdp5YqdhgRQF/s
         yH9h8tvYCZiVWraVVWV/3Sh1dE+jwbDpe6l63GlesrAgmun8mVSFN6ba1v3xcFWrAFWg
         X0GBzAUi3+j40ch1/r0Xb56RkeGJhygUYFhJg1SdYUZR/vZdeSByAhVg5PyQWLBt3JpJ
         L6pqOQOVDIjG/q/hk2KvrfpXK+69NY0A90A2LzSWTB6sgFzmZxldPmutcpzDKaQ/6oZh
         ye5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724331591; x=1724936391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoO4sCNWaPPWmdIdCr2gmgPkfl+OMgV/V6faIdi9Nng=;
        b=eyo+Cw0ypFNgsB3D5SvQdrtsUnPZB3kQBct0lHhnZhnV3jY04HR53ouyKnXbJdgzz7
         QYWb5nSvZe6c5OkPeAowYsyo9dIbAabmnmOhgeYAgCT/v46If8w3Rnk28uE9SPMDav7k
         zAIt+gY41JDSdsyY3q2A6z0KX6u86Zzf/H9xGKqsuXA/31UJirXHFyw86zOMGJdVrn5v
         S8m3oFEdd0nutI3JL6AIuRltwADMUGDFGaBLmkRZDu4DMmckSsNP87xAKOWpdsP1bjWg
         /G+G2tkmPxcszZ+62xC9LaY6gd0n6jMGiaQ23yVFvBKenAlQ7xocj5DIzrxzFQW75S28
         ed0A==
X-Forwarded-Encrypted: i=1; AJvYcCXFl1N5bguECkp2pkJd6jX/CQ6EIk2y5fkrduzDyfWzWQap3jRJD/rwLzNGefV/OXznAY0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6vSWL5b5h+tWQbN1DiEMeCU15eVcqKaoNy2fgG+Z/roZDDpc9
	Z7I8PeJNMRlpJBNdiEDKji8NluLQ04U71AjzZXmOqqbckj/8MShUpa3Qcd/sayeZanSYY4eKCJW
	b7ByluLz10T8xQdwrcQTcMxO5eNw=
X-Google-Smtp-Source: AGHT+IHS96aclJuolbPu0Uu3VPQBNy/41oHFLnv1W7KA1hySaSp8ImFVHLor+SorMz+bK5ND7I6vDrYc1U7/dyqzntQ=
X-Received: by 2002:a05:6512:3f12:b0:533:4191:fa47 with SMTP id
 2adb3069b0e04-5334fd54882mr1147315e87.47.1724331590564; Thu, 22 Aug 2024
 05:59:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819072052.8722-1-eichest@gmail.com> <20240819072052.8722-2-eichest@gmail.com>
 <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
 <CAOMZO5CeT+LvQ__3GUf6teL3=8pZe5qxmFffYJX-h3E27UXwtQ@mail.gmail.com> <Zscl99sSlbhOTrnQ@eichest-laptop>
In-Reply-To: <Zscl99sSlbhOTrnQ@eichest-laptop>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 22 Aug 2024 09:59:39 -0300
Message-ID: <CAOMZO5Bdfe7fqJCCy9nqRG9jbOEKDNymMHp+--PaTygs5pZfFg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master mode
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, Frank.Li@nxp.com, 
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Thu, Aug 22, 2024 at 8:50=E2=80=AFAM Stefan Eichenberger <eichest@gmail.=
com> wrote:

> In your setup, do you know what mode (atomic, interrupt, dma) the driver
> uses when it works and when it fails?

On the imx8mp board I am testing, the very first I2C register write
done by the pca935x driver fails.

Thanks
