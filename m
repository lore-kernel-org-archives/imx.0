Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A764D1E507
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 16:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727713364; cv=none; b=buMfhZSdh3ZzkoFgn5Rgzja1ED9n2CAlERKQ8THxeTeSpz2keK7dskKGz2xO01/RKYRBxdm2Me5vdtnFCagGeHokf+Hffz6z2rmmUEK6LdjJxYdQQMytQHo0I9BHd3bv2QHbPmdBJDaAsHWG2YwrZ3G5btBktUFtRQcye3kpBF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727713364; c=relaxed/simple;
	bh=wuLXXsvmGa6Wkqbw9wJKACQvYoepo61CtgILGgO62tA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t0nWIImjxDBVK/cHghQWBWl9Zj4aflirzJURozjQ3pVi64Pbtwd1PD3Sfojtr8RsoWIxUw8yCyKZJkmNq/kFtA/zq/X4Tmc5iAnAbYTNBehQ1THi2yz9329eLBKSrv0ouajt++FgKgyDhRENgBhZnQcLbceiEndcgZaGkvdmm+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TNh0q6+s; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TNh0q6+s"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52682C0003;
	Mon, 30 Sep 2024 16:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727713359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AkPKgnAgbGFe7mgt13GeZjNd77h1Yl8R02uaedeP1eM=;
	b=TNh0q6+swvpWa7Kb1FK9mnp3NW5W/cAfiyiul6aouZrXgxzid52LiI0OcY1d7yKbQqEkpj
	CKgyGH8w4GbAH3xJJMwse4hwQpd46Ukc0Dp2DLEs0OAoBA2gWOaM1O7OKEBu93GkXqxreP
	ctvGTUFLt7hNmedORp2+u5AkCtjk1jDMhVYpgayxNx3WlN0sqBmvKykkv/sXb++1ekRLhU
	LeUdwMI7oMXhMVJstQZ3JqKFUueP0UVCVqW8QGcDcr+Prga7ujgdPvCHtLzqXiSNKplZ3K
	l9hq9QrULDN8qYb4tcwcQq0H+dl6SEUK6k07QAxsiVyudfXJbIjCJWR9Xe1Icg==
Date: Mon, 30 Sep 2024 18:22:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, arnd@arndb.de, bbrezillon@kernel.org,
 boris.brezillon@collabora.com, conor.culhane@silvaco.com,
 gregkh@linuxfoundation.org, imx@lists.linux.dev,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 pthombar@cadence.com
Subject: Re: [PATCH v2 1/1] MAINTAINERS: I3C: Add Frank Li as nxp I3C
 controller driver maintainer
Message-ID: <20240930182235.52c4530e@xps-13>
In-Reply-To: <Zt9VDJ546znNR7AT@lizhi-Precision-Tower-5810>
References: <20240815141609.4089406-1-Frank.Li@nxp.com>
	<Zt9VDJ546znNR7AT@lizhi-Precision-Tower-5810>
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

Hi Frank,

Frank.li@nxp.com wrote on Mon, 9 Sep 2024 16:05:32 -0400:

> On Thu, Aug 15, 2024 at 10:16:09AM -0400, Frank Li wrote:
> > Add Frank Li as NXP i3c controller driver as maintainer and add mail li=
st
> > imx@lists.linux.dev for it.
> >
> > Add Frank Li as I3C subsystem reviewer.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > --- =20
>=20
> Miquel:
> 	Any comments?

I guess we'll happily take your feedback on patches targeting the SVC
driver, you've been working a lot on it. However, in general there has
been a lot of discussions happening on your substantial patchsets and
little to no convergence in the end. I understand you want to push your
patches upstream and I also want to make things move forward, but maybe
one of the reasons for the stalls is the lack of fluent exchanges
between us and the difficulty to explain bigger pictures in a clear
way. I believe maintaining a subsystem still requires a bit more
experience on this regard.

Thanks,
Miqu=C3=A8l
