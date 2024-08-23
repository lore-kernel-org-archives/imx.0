Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2ED18951B
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 16:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429458; cv=none; b=Ika9KjuLLSYFpwcdJ7vFE5+vc+h5qQ6iP/ZWeNAi0Vvw1/rdQTxwMRvfzfNOkFGpKtINQJw8PkYnNUgA4fXj+Ozig0CRWme4G2aVsVQYBVsaRVXKO8Fb75V0JaCBy/lq4C3a24ENsV4F3WfQQ+TScbd4Sf3L/MbHn1cjc2LNcAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429458; c=relaxed/simple;
	bh=OTgGYKu2x0zUKSDgcu/aPbz+tb0PHBa0K0KAuoUGdlY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eibCmTDpem2jncM4sfttlA476OyKbPoPuEqNHPDlwKoJSTM2KcS/v1DpWKU5JuC5yOqBhxfFVQdNJ5OHkfb8YpbC54Vq8kq1Rgz0ebaIU43Vniq2a66Jws1ajUvaDkR6hqsVqp9WQsW00rSWzHjq0R3F4N8qY+BT0tMBJZzabAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aoPAuVp/; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aoPAuVp/"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13D3D40009;
	Fri, 23 Aug 2024 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724429454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OTgGYKu2x0zUKSDgcu/aPbz+tb0PHBa0K0KAuoUGdlY=;
	b=aoPAuVp/1cIoLFPBf8qBDCysN7ZELBNzgpxnKiSg0xyPrispsWeedQ9LXmP6X00itXfHg9
	rpdRM0XG88qlckXUaPoxRbzD3k03L7eJFxJSqyGdbsFYzB+VcxcqQj7Z0aC9rjQNeatMdW
	UiunmznfP9Twd2SnuEDbknS8KVKRSkI1vJbMuAV96IdEbWtEMGHqREsF1SdC4sh64nnpXU
	FPAr7ESIfcCSuOUOVJU0tPVigjpGeHiwAFx+ZE8wyGxButwFtbs4MExqoNPuedOdnLXIg7
	fqzddBVpESdRhmBOjT0FCEjr2Gx7mlyaDy+l7e8NWDWiTZ7wXck7X88+P4Tdtg==
Date: Fri, 23 Aug 2024 18:10:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 07/11] i3c: master: svc: manually emit NACK/ACK for
 hotjoin
Message-ID: <20240823181053.4a793095@xps-13>
In-Reply-To: <20240819-i3c_fix-v3-7-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-7-7d69f7b0a05e@nxp.com>
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

Frank.Li@nxp.com wrote on Mon, 19 Aug 2024 12:02:01 -0400:

> When the address is arbitrated at send address, the hardware can auto-send
> NACK if it is an IBI. However, manual emission of NACK/ACK is needed for
> hot join or controller request events.
>=20
> Add help function svc_i3c_master_handle_ibi_won() to check event type and
> send out NACK if the event is not an IBI.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
