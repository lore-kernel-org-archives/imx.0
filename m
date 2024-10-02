Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836031754B
	for <imx@lists.linux.dev>; Wed,  2 Oct 2024 07:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727853543; cv=none; b=TaK7VOPyj548QJv4BArn9S9FfvFyh6MpgKvTWn694C6FAoRHJ6hBVNeDGh4ip89xq9Wh9XgQrWWW9FfDGnJ/SP7HE6ep7eUXmW6K7/oXwRApKLT39rjRi0NhfEprRrO+jpH+w2bykytmnTVeCuBc7+UC4j+DfUECHk8qVIvX3JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727853543; c=relaxed/simple;
	bh=h2L63Hjt//sawD6KF5ZXuFON46cUXT8sUuXLt2VSNP8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cdDuN/Ujcr+1f+M326DS5AAozuMeTjtrGiVDT8rIThqk5kIUw/XETmjGhPvV8q5Ko9Z0rYCygGZlk7EIG16sChJd+vt9eFdUUM00dE8K2Snsm5sIOkDBeEc+ZZHt5n08Y+CsJTlATtJ3Lyee2nVY9n5f6XUZ37sLXUQAoC5AxFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RNkBufXd; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RNkBufXd"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3AC1FF804;
	Wed,  2 Oct 2024 07:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727853538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h2L63Hjt//sawD6KF5ZXuFON46cUXT8sUuXLt2VSNP8=;
	b=RNkBufXdSbZHsntgIhy3xUQxbrYWO++SlOZjyz6wNVF6VFe2Qt+oFWVu0pAIKol0PFX3SJ
	fJOiwoFSUrvblvt05eKl79ZJ3qXqct5Hth16QJEmBTvEKu4leZJ/NM6kjR6e5UoxZ+PMZG
	qaHHLPrUGUkaXOM1qO9Aa4fuktg+ZGkby8jVqvho48fERknVYy0fz7ZW01FdoqyDEEmwoK
	Hn/YY8LNDP4DdEG43LyuabaQw/LcjB3jdmg47XsxbRTTpc9UFUPTDg09G2kGumqFbtdVjR
	/E24cXXxbs3jL32PIbXaBDQIkdlOI8+iPVRaXNU5/OsmI510NmIgOn/6BFRLpw==
Date: Wed, 2 Oct 2024 09:18:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 bbrezillon@kernel.org, boris.brezillon@collabora.com,
 conor.culhane@silvaco.com, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 pthombar@cadence.com, ravindra.yashvant.shinde@nxp.com
Subject: Re: [PATCH 1/3] i3c: master: Replace hard code 2 with macro
 I3C_ADDR_SLOT_STATUS_BITS
Message-ID: <20241002091856.17ab576b@xps-13>
In-Reply-To: <20241001-i3c_dts_assign-v1-1-6ba83dc15eb8@nxp.com>
References: <20241001-i3c_dts_assign-v1-0-6ba83dc15eb8@nxp.com>
	<20241001-i3c_dts_assign-v1-1-6ba83dc15eb8@nxp.com>
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

Frank.Li@nxp.com wrote on Tue, 01 Oct 2024 13:08:20 -0400:

> Replace the hardcoded value 2, which indicates 2 bits for I3C address
> status, with the predefined macro I3C_ADDR_SLOT_STATUS_BITS.
>=20
> Improve maintainability and extensibility of the code.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
