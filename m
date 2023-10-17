Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6258843A85
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l9ZgiPwg"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0506240004;
	Tue, 17 Oct 2023 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697551501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n2SWgNzwjbBpSUOPGOrMP6yTVIG3XK+FVYK04/px9Nc=;
	b=l9ZgiPwgnCd8UaS+fNemzxUVyL/C+RETm7R5MvKzrQLG6sX0OaHgHAwWmSxAwGHifxKM8W
	+H1oQp0uLo8Fv4tjQfcQH48vA4GtaFD47CTSsfqjxlC6L1r8KxgUuphF5DitIfFKsRx6WR
	0nYkShZbHZ3KEFe2GD00si33MjdobYNPwihhAvh3oqbgNAJaodI7WLAE8oFozqlX83jdnf
	Nov2IVJUSPhjigdAPofmCdwvPEdHMfXdVLzKYuKQH82lV2Wkzra9nkWVwYDXwl9iKBv5Zm
	bYBRZZfbaFrq+0eHMnoW+X8Xyi1RA6l9py/6iZyTYf3FGrzHZ3y6B6md30wpsA==
Date: Tue, 17 Oct 2023 16:04:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/5] i3c: master: svc: enable hotjoin default
Message-ID: <20231017160457.4f0c2490@xps-13>
In-Reply-To: <20231016154632.2851957-2-Frank.Li@nxp.com>
References: <20231016154632.2851957-1-Frank.Li@nxp.com>
	<20231016154632.2851957-2-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
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

Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 11:46:28 -0400:

> Hotjoin require clock running and enable SLVSTART irq.
> Add module parameter 'hotjoin' to disable hotjoin and enable runtime_pm to
> save power.

I am really not a big fan of the use of modules parameters. Maybe it
makes sense here. Alex, a better idea?

Thanks,
Miqu=C3=A8l
