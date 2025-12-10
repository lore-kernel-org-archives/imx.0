Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B7A274670
	for <imx@lists.linux.dev>; Wed, 10 Dec 2025 03:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339092; cv=none; b=OhRvM43n8Jkv8le51Px8dcdUJaWw7O30DvxycRJ5Ny/fmZoR/UcalAgN3Z+J4Z2cR+F+1iNnAKc9pl6S085zejvzQJeeY+Nzz4bXw1X/aSFy8664+FOlVsHRnH/yFnVDDRhoFPasy24h/hDSHPb99Dcs8jnYwnEEHrNp3pIXCPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339092; c=relaxed/simple;
	bh=qrrddUg0J/Vj3a3W8m/yYJDr8fLKEDPh9eHraAS8sLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDPhjIzn5EX0F05LURJyEmGGXRTv0pTy5OMOpjKSIrxzgsMEIHREQYbekMp76YP6Do78rZFprJhNZQhqPFfH0NZGv7UWyn0QS1GPDmUU/Xk0B08m5f/v+2R7kXTL6hHVK6mM4WD/oNoZW+yMeEGJxiR7SDqQIs7w4XYcq9ukUlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvAjpKFK; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvAjpKFK"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4f1b4bb40aaso96571cf.3
        for <imx@lists.linux.dev>; Tue, 09 Dec 2025 19:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765339089; x=1765943889; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLoOmL2OINkQVzeV8Rqv6NYJGZqFQ0WjVAMg3gQeW1M=;
        b=BvAjpKFK1kduxBbLm4SeNFjVZLTuCSTWv2akqaaWixtgG5KDmRe+xPgqtCr1ePq3O0
         Q32HrSvvu8G6fSoJKvtJ8YPPM/7EoSfzP3qc8Oh63HATWh3Th04rURC53Y5QemDolnr6
         9J2m1oM46Tq2MBvPIoDDHKKvxvbsaFMIZJTr2rJWuj7/L7dTjC1Gig8G3WWUVtHjHX0S
         xs1WG9sS8hCoako2wPNv9p4xK6jXciyW/dljoBcZ+PKlMqaUUG3oZ1qkbaCTBTWaWT1D
         /n7Y4ASMeFG2NlH8Zgfgyez3lvM1dk3TFtDSWteMdhO5+e2bgX75hvuAleWG/CNy/zLW
         WjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765339089; x=1765943889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xLoOmL2OINkQVzeV8Rqv6NYJGZqFQ0WjVAMg3gQeW1M=;
        b=hCngTfUjdKNF1k8OoUreK2bOzchI/z+ubtQNgdBsiM1bgSUqELB5/n1bKmMFkh2C02
         3b5myp7hFAG1D5OgimgSGPFOeogS1Yn2LC81eN2gkSb30eHUEXb9CGHI56zqMQmG41YM
         XpqJZ9CYeoAllYzOO9Ig+8C08rUlVCnN1WSaK0vZrlynWQewdot3WKXA5+gAGkloBd3Z
         RpeXBrKaC5z82MBcubpwKiTWDr92Arl3OCHBabh3BNVRuS0JtMIn3/u22pOcYsP+mKCK
         g2446OKRU6jEwpCV07VWDrYG67qecv7aw9sSpgO2bgKGKw/v9YhrLzYq02Y3cvMGMuXK
         N48g==
X-Forwarded-Encrypted: i=1; AJvYcCXvxWYVK8vdptlyLn2Y2iucgPgUP62+Xi96lIILNWyUDJsME366Jbaz7D2yoOEwGgNp+zM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfMC3NT/TwBT/996gXmZonC2jFvRyCJrLa69efsb+VpUW0KAfi
	eU/B/AEND9RyF4zgan7Y07+1+Fh5GXIvNkJ1J/Ia83NH5Tx1ZfLTsyqPtZlq5nhRluFC/3W75Qt
	xKjMSHI5/mJAo7yTSxvYJziPW2Y5s6C4=
X-Gm-Gg: ASbGncsUMB4KNfeF9uKQqJSIkCHbeQa6Mu4EYLGrZQNKej4T20MP88ltmqOAQh2Cho4
	Bmowezb6sGtmkdbIQvENfABSMi4+Il/mjZ3eFQCd3Um9ro8bObsyg/MfPgr0s3xDo+Ul91UuddS
	m7ZyoFSfIyaPe9vjnlkmFJ4kO5mSuzIHaGze/Xv3n0lFVjH5xht8FItGjaEl4+ZdPgOVPppQ4qh
	s3jU0xxP5Djm/xB7bzf3hxxG9/oc0Q4BFPKUf1l3TUe7bABzIPzEsX0oICJEkWxZ+Ryx2dnlAM+
	MUuQwuSM827AvKDXSDAp0SOVYEq+6KZmL7c4f/JnTnft8aUBVEuqZPlv2pjzAKaz9sbb41356KQ
	tZms0F0eT+w9lO2eOS/k2DEvpV36FqqF56rk=
X-Google-Smtp-Source: AGHT+IFGSPpDaGsF7GV6bSeqZjzx0wih4VR146dqGL5dRtKu2H9I9xlLneXMcdOPKYcfgnDqQlmhKeVlt3Ia1lJlppw=
X-Received: by 2002:a05:622a:5d3:b0:4ee:1dd0:5a40 with SMTP id
 d75a77b69052e-4f1b1aae5b4mr12728361cf.59.1765339089481; Tue, 09 Dec 2025
 19:58:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
 <20251209-tdm-idle-slots-v1-4-38dabf6bc01e@gmail.com> <aTjZc3mgu7CQOkDU@sirena.co.uk>
In-Reply-To: <aTjZc3mgu7CQOkDU@sirena.co.uk>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 10 Dec 2025 13:57:50 +1000
X-Gm-Features: AQt7F2peQnceaEJraJhL4gaHZEV1D4IiSKkpSo2-8pS48v4HYxCHrY9kKA6UQpE
Message-ID: <CAHgNfTxmYxNaYOdGK4Eb4ouCqmUCjVuhzGdgTAL=+ybObqrCmw@mail.gmail.com>
Subject: Re: [PATCH 4/7] ASoC: soc-dai: define TDM idle behaviour modes
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, Dec 10, 2025 at 12:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Tue, Dec 09, 2025 at 07:31:17PM +1000, James Calligeros wrote:
>
> > Imagine for example two codecs sharing a bus. When one codec is
> > transmitting, the other must ensure that it is holding its side
> > to 0, or data from the transmitting codec will be corrupted. We
> > can trust the "idle" codec to simply do this itself, however
> > this is undefined behaviour. Some devices may leave the line
> > floating, others still may pull the line high. We need a way to
> > control this behaviour.
>
> I'm finding this explanation quite confusing - you appear to be
> describing the situation where two devices simultaneously drive the same
> signal which would be extremely unusual and I can't see how it would
> work electrically.

We are trying to solve a few of problems here, and one of them is
a bit odd. I've probably jumbled up a bunch of different things here.

We have the use case where a codec enjoys exclusive use of a bus. For
these, the codec can transmit 0 on any unused slots to hold the bus.

We also have the case where multiple codecs share a single bus. One
codec can weakly pull the bus low when it's not being actively driven by
any of the attached codecs.

However, a number of machines split six codecs into groups of three
across two electrical lines and then OR them at the receiving
port such that they appear on a single bus at the SoC. Because the two
data lines are ORed at the receiver, we have to guarantee that line B is
zero while line A is active, and vice versa. To do this, we set a single co=
dec
from each group to zero-fill during the active slots of the other group.

> > Thus, we define five possible bus-keeping modes that a device can
> > be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
> > (actively transmit a 0), PULLDOWN, and HIZ (floating).
>
> What is "explicitly disabled" in ths context?  Why aren't pull up or
> drive high options?

The OFF state was added so that consumers can explicitly disable
any and all bus keeping if necessary and supported by the component.
TAS2764 and 2770 both initialise with some bus keeping features enabled,
hence for this hardware NONE !=3D OFF. I suspect this is the case for other
hardware too.

I neglected to add pull up and drive high simply because none of the
initially implemented hardware uses either. I can them for completeness's
sake, however.

Regards,
James
