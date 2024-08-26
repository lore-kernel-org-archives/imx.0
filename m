Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A175F12E1EE
	for <imx@lists.linux.dev>; Mon, 26 Aug 2024 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724660017; cv=none; b=UIFxnWPWaxpa1TG4Bc3I90PkNrdC0qI+J4utmqggnQntLoiVgvdjRIDXAVYMt0a3JGjjg3OaMccpjsGAxZHxOhKkLbUrMRq+s5UGpmYptEICHWIj24p3dImuqe+4eGp9aSfXa5TVKLtyoRJ/EU/XEnBtP9zEQ7en/NAXvXAH4R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724660017; c=relaxed/simple;
	bh=Qp/00LpdFt9fyZ9y8QshjY+ptg9wzwMtAYA98L2na+o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XXs4XCHAjQOJdnJJl8zUsSAyPnj3UU+m9F4tfOgfeV8E1yDG+YtRxI/umn4zwwaZTwjby2j+rgQDpMe2La+YAzFIbjOSe5cjQ9sAlChm0kl5JGpuTY7Jt4L57WsbqpzH+/u9/pgfpaljN7pUu9vTKVhVtS9KqRJGyy2WefQRPJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LrSIsxdl; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LrSIsxdl"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D35D20007;
	Mon, 26 Aug 2024 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724660007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qp/00LpdFt9fyZ9y8QshjY+ptg9wzwMtAYA98L2na+o=;
	b=LrSIsxdlmUt5Cou9Feh8QCcpu4xZ0fj6zVtQ2So7NSmWHulQyMiQPZs67HToG1ptjSlVRf
	HGZPAGVF2OZOOdGJ6BXW6X8oOScS/y38En16izvGbzQMHpVdeO9CDkdYMq3x7waYSg0F0t
	nFwf48cMzmjz1EdvjMOJnE3at65uHFXltVc329sYuKBtUng1mhGkgJ3l/Le/i4YnJMmjIf
	vn4rIxT8rGOjWv6o4MtnRaaxG4QtA08OMHSTrlq4MPpTBiOH9tzKZc1qZxK8WP1RSYHOrz
	D8x0HP9JxckoBRAu53ANliqxTAUFC8Tumti1BDG4AdLT+qN9LCn02dnuXUCF2g==
Date: Mon, 26 Aug 2024 10:13:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: carlos.song@nxp.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com
Subject: Re: [PATCH v3] i3c: master: support to adjust first broadcast
 address speed
Message-ID: <20240826101323.746b617c@xps-13>
In-Reply-To: <20240826050957.1881563-1-carlos.song@nxp.com>
References: <20240826050957.1881563-1-carlos.song@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Carlos,

carlos.song@nxp.com wrote on Mon, 26 Aug 2024 13:09:57 +0800:

> From: Carlos Song <carlos.song@nxp.com>
>=20
> According to I3C spec 6.2 Timing Specification, the Open Drain High Period
> of SCL Clock timing for first broadcast address should be adjusted to 200=
ns
> at least. I3C device working as i2c device will see the broadcast to close
> its Spike Filter then change to work at I3C mode. After that I3C open dra=
in
> SCL high level should be adjusted back.
>=20
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Frank, did you test it with eg. the Silvaco master?

Thanks,
Miqu=C3=A8l
