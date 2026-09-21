Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB42274670
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 03:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961485; cv=pass; b=imX+GxSTbOE6d/nYscHhX1YmlHNEOliaHN64k8CRR0lVZZnYleBwkHBdUQYoMHX+89IUeiIFGY5jGFKqDIEOjR2+7dXHBCQgRt/XvQCDxEjqCcfAgWk94hIhxGL3vadky3GLAvhFV91uXO5IxvoGpMuVSt3cAW7vtkgbCjqgkLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961485; c=relaxed/simple;
	bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bquGRLZNOUBLYcH3Sddk9O1yMcUo+q3tN56Hld4bFP+Bz6jxbyC65R61QF6/xxU3i56kzI56lxYilv/TTnwzr4avVRbzL4E2rDA8/1Fr/gf2rv6SN1yIUh5+ThKBTFshCNQcTzZBqBo0lRLd2I9GFUsaW3SYtiswjxlKUAGWziA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RiLSjEYd; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RiLSjEYd"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98dfb8002so3469121a12.2
        for <imx@lists.linux.dev>; Sun, 20 Sep 2026 20:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789961482; cv=none;
        d=google.com; s=arc-20260327;
        b=Z54dM3adL7G8GmQleFbSOt1QR9mGW56VQmduRd6fC0OY/08RSqgfjFV3PLCcx/q9xt
         9x13waCHdJSLF1nqOAOuZapHhZxMTW61cPi2XC1B+geAjL5hTKYcktQlkqF1kw5RCXW+
         dVbqCsn2cIIvNKfb6mZYh5XTDYx06bHjPZQwJ+4ehzwgICxQYJHN5cMTRrLd7v0rUJLe
         ZZEFCP2x1m4j4beWAHY/CnG2o5Yg056pGjQq8HxjkVus0gNcmMDj3cnQdmo9g+uyPnqU
         CU4E10FMIRrFb2Kw6C/yROF19lQvVbOa7pYFnyZVJjOfjsESaJ9Afvn/4RxfuyVjldWc
         tOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        fh=gr6FQSlk0QmVMV/5dwjUDQCvpSFsNpzpX+O1CiFPawE=;
        b=fhWX3+N1T2I9cgpP/++mJTY+fbDWt+zY1U6HGqUulNFEVaUV1mbTc2jziNxm/suKf9
         eC9EegEld9JlPIYSkZbZt6tKl1YQvowzmEunSB+KJT7l0dycys/JVtan4eXeyS75O6Vj
         Njivcj1UWQG+WG82DthUftSsChJWPeg57OQTAtJrx7X4fXvd57zSWPv+1+Vd9QNFh/8u
         VzLguxXbLuhDoJHqnS+bUXcxhwab1iRc3djqWlx+Qfy/k6qXXnAnixKnRZ3YHv5yD5OV
         IKLsmSOd2usv4OE6byduJ2gcj/i6/epXSUO1aBO/pmduDZ/PwNdWEn6n6BAlfeU86wvG
         Y7jw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789961482; x=1790566282; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        b=RiLSjEYdPu5omADaMBZS/9YLX5kZkj9gO5rjW/VD+96biz1hgSuAiGZuKq4CNvPGtT
         /0X4Y6MA3KpsUr+n5Odv2Ooj8CAZEkwiee6uqE8wlP7DUxYw0yEeXK7FyBI85aR6jHGy
         /ZwtcieBfUVSJ7FiTJOmJMdRgn7mcpIdsai1nu2ubiJ+gmEmff8OVe0+D07vvoUnVO3A
         bKiC46cQ0VZV2DPng8/5eG9FBeCT83yYHffvhmEiPEVUYHhaRxBTBETnHI7GsaupbCb1
         0SnWWtH/WCrlNFt3yF2uSwcqjUH2ZAFKCKaxrsIshoDQnTl6hm0lGENufq7xTW5T5X93
         YTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961482; x=1790566282;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        b=zddoU9u/uq4MN1Z1AvhokZ3u1M+iwESnS+gggCGNhwH9/okFel3+vn47oRhePusnYP
         XOwYRNI8HjkgpJ5ob9zRjNiGfwtgaw6MgobW9zMYx0PwtaDaWbnzbTJS1I6vmGqeS7SI
         cw6Mkucz277n8kw1j1qIvmYSEUjgCatRNOc9BP5DaRvxz0OxRzqLpCDswsl1NGZNO6hB
         DuQmhOJVc9jwcJWtVv9anpMl0qwRMHxbgIOh2E7Wf5mAp4fYgSWTHeKeo4bzvB4S8ZxY
         x3L+S8WCedUCi9aHOd0qZ9jGtbLjBu33EN4hbpEqSHZwbd5u727WJpLC1qVOIOmjSH24
         AJOQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4JGEuJuZnnEUc/0D4Ha8Hx5R7JwNFDz0xLRhxlq/PJNGIakxi3WxSM9Kfo/+7yvRTri8=@lists.linux.dev
X-Gm-Message-State: AFuF++lqJYCgrJqECt2HMbfKivBiQUuVRH8zu7PD4oa1MAA5xW0JnK3T
	zhdXfuhXq4QhlDGWnOBQuk3ljoIZMAFKKUWIJJEdb4L/RBgUbt3+MFboKO34gDGhbWNIP0IVw7E
	R0hE4wcuRSn3JpYnQND8igd/wlZKPiSDqh/MoybbmoQ==
X-Gm-Gg: AYBFou1h4oJfq//uub27RI7qfFwdmeHuaC4N1EgLsS4CgYvDeBukqYRXPt3dbDT8k7Z
	jiJB7LIQL9vQkuvHhqXpFlJlV7kNlP1BQ9pFIl06RU414SnBjUHEZkfDZ3JPIkF7xdGYA5xdGf5
	GBbt1vgpE3px1qb//yLKAR8Yt8LaXrIw+1U3UAaL+ytyKOXZeHHbRhy1hWYoCPkaUWkciLQwURM
	20peAwTmQoZubD5qvImuzmfOItKU90NjH9b24SE7FVVDsFLaw4X+MkCLV8P8zq+UgjmVBuVRZis
	uALMktSAV9Xl2o7DAlVMgO1qKmemPJfOAyHwKqrQ/ergBaAdIULT1683RTZDdp8VomjrlxRZB59
	ntjeHqDeRj77qFg==
X-Received: by 2002:a05:6402:4394:b0:6a9:ab7f:c8f with SMTP id
 4fb4d7f45d1cf-6aa54611e57mr5885453a12.17.1789961481999; Sun, 20 Sep 2026
 20:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <aq1sooGCYUiWbhMH@p14s> <aq453yukMHiNb1jp@bywater>
In-Reply-To: <aq453yukMHiNb1jp@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Sun, 20 Sep 2026 21:31:11 -0600
X-Gm-Features: AcwNN1W3qE53RFtHuPGOztjJSdwljZIvy9Wk3z8AN3NJ17iDKQARaTMy5b-3hH0
Message-ID: <CANLsYkySF+eF-FURnnT6UJv7P5Sg2HdfMSBZnZy_BLyCMvuofw@mail.gmail.com>
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

On Sat, 19 Sept 2026 at 01:33, Francesco Valla <francesco@valla.it> wrote:
>
> Hi Mathieu,
>
> On Fri, Sep 18, 2026 at 10:53:54AM -0600, Mathieu Poirier wrote:
> > Hi Francesco,
> >
> > I have started reviewing this set but given the size and implications, it will
> > take me a few days to get through.
>
> I'm going through the review done by sashiko - would you prefer me
> sending a v2 with the trivial errors already ironed out before doing
> a complete review?
>

We can wait if the errors are trivial.

> >
> > Thanks,
> > Mathieu
> >
>
> Thank you!
>
> Regards,
> Francesco
>
