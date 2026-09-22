Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B106154B1C6
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085203; cv=pass; b=U2qwMmzDDZCi4SV/7nPiEVt+fM36NGX3jsmXDHXI1FMVXBBsCSK4gFstCajPvtyauyWQ/0aA1g7nX8Bm8GdNvtSJ/CTV3dvHgcW81wDMsr86mZjuBFtzffQ0Kl50xOqnrDmvoeSJBnqlyGTC72OImUX6qiiloUwI7pVgc8OMZU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085203; c=relaxed/simple;
	bh=0hurBNTkrVz1B/9TW5ipWegr4/ZEEZE2GB3faJsOdT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rveZ5qudHfNHc8PBETWiX+y3rAadG0G95jfJrv4JAmujlWEkQStxLeAu0M4wYv+6GPJY8Xjy4UrKnAFtmSj4H4uU8RSMPW9bnS3HQegkUl3VMWA/YZWkWF6CYywSCOvPZeTRpH/ImlvCgFohRUbX0V52SqvfmOo02tNWPRyIxng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xJfQrXKj; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xJfQrXKj"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1da63791so5253651a12.1
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 06:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790085200; cv=none;
        d=google.com; s=arc-20260327;
        b=j3K0lBdejye2RQ84ljWSrzkxm1WmoZ0bk9/isk3WetpKx4Q1l40uXaPw07djH931SN
         ckhnd8+YPGZtNxTt7yw6it0EM1XjJhiNoT2z8J8C2jtxFXnCvloww6X6cZ6BUmQ61sUk
         tdfYHt/+O7vJOI1yOq23S8+b1OeOSQk9sdczA5ZnduQbwm9ubT5FeyjTUER64RXh8mZR
         dvbgkTd027zwLCwdmxpUYHgjY1UrNoxLc7jrVlyAmEeQ4oQ9/v7RujQm6xpTKeA0fMGj
         wq4NyuyAV+BMVo/9Qic+IePV/aZVZsyhfckKN12+04/V+hucfosBjqMj41BjH0BxjANb
         A5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        fh=2nkqHUvAfEYfO3/sdtc9orXA+RS6oMJyiwGaaEjKESY=;
        b=SON0OixDU1De1wqlO9rpx16le33h8TR1TCPJLP5cYWxX/nHRuLnJx5b3avXvqigoBa
         8LYQSy9SQbrkJSET8+20BGvfnpSe4wx9jiZ9kGeBoGo1KUj2qhpCk52rfC37honsM6BR
         tCIjIUygNkRYsrZtRMxjXq235uaRcGDQaEln4pL/plfzG62B/BQB255chJi/km+5NcMm
         FOxyCKr9JQFOQ/bYQyYXhdCr/ifOVq0pmNHqODe0tVAitZXzPwo3eXxZPEbcnWL86UaQ
         ReWYogXn+27MEWyoTG4YLlohIoM6I3vAFuWuj2ZWgpaeiBrjJ3XzLsKKTPaq/sZl647O
         PN6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790085200; x=1790690000; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        b=xJfQrXKjUWONG38womQya5smAp9gsRcpsxsyRwgvpI5Dp7ZDiAkkzhfhHut7wFte5B
         vQdLlY797vE0NiHcp7Y35lRyoX1wo+MTiIN/rdxz6CfM3J8VNvty72SPio8AFDVBzwtt
         BscQFUVPPVojZdoPhHUwDSyS6OYnVOUkLIZCS67aPx1uYCD1YPVUGkaoqPaYqjPZ3igp
         AqQTgK3EhsTKkNywF3NQRTaobCOmXVWantfAtBgIo9TiOY/5HUx3kLdx3v1v1zanCfet
         kCeqGTws8GhEDy/4evDN5CNx8PM9QuvWGdT+culDnAwwW1Cqvu6e2RPdBe03ClsLJsRc
         VDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085200; x=1790690000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        b=P+UlR2y08R2rTqlmJGnt4sKmFeSPnyI99OtJqShU9jA/iIJaYTrk1/tQInSJLQ7tva
         sLhYJ4RgExihoXtBdgfjlrw6S0xx9z2+OxnynQUhOAxS8S4TFYILt4LaOIhIEHG1cAXK
         XMjj2Cpt+w7QleRHlHEYOi+hbvCjFiK0e5y7EO9R6MFafs3WzVJ9Y+qzHLuAMh5OnZaL
         yF5MDRSA5c7YKPY0k49JcpHM9bzrDidcZwen1pXhJvv7yt1WI8Z1xIi9BmJTZxiTB/9Y
         vxyK//m/ZjTFN6eHdZNO/AydvVmc956DdpPKa8GzH8DeiXGU4RRwl1rM5FmOdCoM6Hmg
         p00A==
X-Forwarded-Encrypted: i=1; AKwUvByY/DUsyWKk7USiQm5XOKBjAUsx/PsDYLCM9FpngeDKzLJ4r3uE3AjeaQ45k/jamSa+Mls=@lists.linux.dev
X-Gm-Message-State: AFuF++m9bnUGyfIm/V7pMzF9/5WdQNFDRRkwBwZGuCj+o1HChXA08A48
	/PhhMYqYtrqgEbuPNRt7Wlk+Y9NX80cEJ7A9zy2ZhaSMxoYoKlwau5ei0/wFvp/uyJj/wcISMp9
	sJzlmgRSkYHktuJav+iNS5wdzyw82rf/uJICKlplhgA==
X-Gm-Gg: AYBFou1akbFqb2s0/CLfKCuLL0Wxs5CnLcif40Qn2W9+YjTTchguYwcq5uo44SPDaih
	mZsFarX1qpXpFgvZxlCteHNIzSq73iuNxNqVo8nI1Wk0RyQ6s8sYW+H+zEAnNpRJyAkFycpTSDO
	uFynVRpHXXOD6bja2v9KT17m4XAWp7CMQRMuLyIYc0yIep2yFGeZfcDtXlqvw1y9nxTxqrIZbJc
	a1q5z/DN3EyKkTM2mrRZbvGMCwWqAJBlKPRb78EmH2xV4kcKYxi7cBuq+DeHTF4RqwOczy0+CFC
	bkdYszW1oX6AV0agKxEoN19C7aqtByTa6AHDZNeERmxZ+pYGeiWq7acHarTuD7gbsV/9tyXIXTZ
	wNB5vcD2kN2HG
X-Received: by 2002:a05:6402:20c3:20b0:6aa:9210:262 with SMTP id
 4fb4d7f45d1cf-6aa92100342mr3351155a12.22.1790085199929; Tue, 22 Sep 2026
 06:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <aq1sooGCYUiWbhMH@p14s> <aq453yukMHiNb1jp@bywater> <CANLsYkySF+eF-FURnnT6UJv7P5Sg2HdfMSBZnZy_BLyCMvuofw@mail.gmail.com>
 <arIfj-1Ji6HEBHLJ@bywater>
In-Reply-To: <arIfj-1Ji6HEBHLJ@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 22 Sep 2026 07:53:08 -0600
X-Gm-Features: AcwNN1V0zenE0U1QivuzVoqHQLJIIYIxl9SSuy2ocYOHZBqajP-1AfG4uh0OqKk
Message-ID: <CANLsYkzaxwx8NJAOki_wkzauL68ourd12qF8PzzVKW++PJXZfw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:29, Francesco Valla <francesco@valla.it> wrote:
>
> On Sun, Sep 20, 2026 at 09:31:11PM -0600, Mathieu Poirier wrote:
> > On Sat, 19 Sept 2026 at 01:33, Francesco Valla <francesco@valla.it> wrote:
> > >
> > > Hi Mathieu,
> > >
> > > On Fri, Sep 18, 2026 at 10:53:54AM -0600, Mathieu Poirier wrote:
> > > > Hi Francesco,
> > > >
> > > > I have started reviewing this set but given the size and implications, it will
> > > > take me a few days to get through.
> > >
> > > I'm going through the review done by sashiko - would you prefer me
> > > sending a v2 with the trivial errors already ironed out before doing
> > > a complete review?
> > >
> >
> > We can wait if the errors are trivial.
> >
>
> Not all of them are. I have been a bit to naive about the bounce buffer
> management w.r.t. what can happen if a memory area is not specified and
> I will need to rethink/rework that part.
>

Ok, I'll keep an eye out for that.  I'm already halfway through your
work, so there's no need for a new version now.

> Regrads,
> Francesco
>
