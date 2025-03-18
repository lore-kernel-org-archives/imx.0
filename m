Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4481DE4D7
	for <imx@lists.linux.dev>; Tue, 18 Mar 2025 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742288144; cv=none; b=Z/j2WBtQ0lr+HHO1Q7ZGGcfZguBUxM08+we2Refn9KYCQFRZGsaZCuehMppBLEcdVZw3JeswPClzCpghdS4ii2ySYOUTUu/EzZ5K3oQ9xSnpLk2WrqA4voqswC464BzopqkWyfM8v+foIiBmESWlIaWD+L8bNzScD+ZFs5aZIrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742288144; c=relaxed/simple;
	bh=bcaaxFP1F23l0PdiW65JYiPYj/NqcM8962Z2DTxPBxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUpjzw+meDhYU235FK00SVlNfYodn4g0ubeyaBA3WageHdTwotLMVAZyspCkT2vRNF4KIK4HAmc3AOL5j5wTyCoUmcoziv7ixk97W1b/wMjsAFaKBDswAJqJnvNnbHakkxqA23cTDNLVcbDfo9XEpeYci80KR9npJpdKsvLPt00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlWS0y0W; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlWS0y0W"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-225df540edcso71612345ad.0
        for <imx@lists.linux.dev>; Tue, 18 Mar 2025 01:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742288139; x=1742892939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcaaxFP1F23l0PdiW65JYiPYj/NqcM8962Z2DTxPBxc=;
        b=NlWS0y0WG0Kl6qGpxh0K3eTP0xkeQSCcpXRW58vLoTDwGLQX7kytOzQlfoOSzMMRvT
         t89PkJvQ2fiaiffzSWOwKaHIzToRai9A31tKekpCYnXPx5obFIOI2QyXJxGuhKSRRqfc
         NYPOK9YUTHFsGks8FWzpO9PjPyDmTS6clH9vlXjJWiavOVLjjA/Ynq9yhKefJhEHijrd
         Nd7rhyBeDBLBzvFp0fJ4R8ikbfkAhtOqycVzewEI2xzL+gQsg4PWsFvRy3RtqgNTDvEv
         1lONGE9dnAcQ1bPdL4XdAcEiewbKQwk/BblbkxQmUfDnOeLYVUT3eg3enHbpwYueRXe3
         fjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742288139; x=1742892939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcaaxFP1F23l0PdiW65JYiPYj/NqcM8962Z2DTxPBxc=;
        b=UVCD4U434MdsJowc2Ckt9hxgEJqcK80adqMtmDupaOh/pcUvg4MRHGOsy/UrXDvIPv
         if+am/qld2j4t/EGIuQkF6W9DQAmSigofTyNQF+Piugtmsr93UW3tz/k+t9Nhc7PH28n
         ENS6X4CqjgP+wPcPdH78abGUYUJHFBFvZu0ME0EK+wptdKT4SqHtG1yeYHim0Gfpvk+7
         agcZSMaVcxiPCgdhfKOsQpEeqTQAbqoYfruyosmx/nvson7nTGU+5IN8ij+1j/MAU7DV
         PXsnZ4QpE2KqhJXuvGx1KKnHVDNBZvJtq1ED3bMGyysfkO0BpSUZqJ0o6aIFwUkLg/+8
         oy2w==
X-Forwarded-Encrypted: i=1; AJvYcCUmzuGaPQi/HIGwVT923fJOAneE0nn9sZ61OVvcLjzhGTSPRvL4Cp0LSe5dnt9rE7w6UAc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpHy9ETrdAYgKgR20V/haijYJRIEAd1bD04yHAK9Od4IGQbVYs
	YFpPlbL9zZcwiHXuNwXY1ga8WzKeWAMKl7/OxnW9ocDuRiA335WgKSPs9YorsvBLQ55QLgWL3cI
	zFvGf20gVMjTQ5dV9X+upK33VixU=
X-Gm-Gg: ASbGncvdTQrwoI84tMNddJkhfc7iG/YGD/QisGY68/jCO6PC0Wdo/6nj2I/TUS8tPIh
	CQmHUz3fu2Bhrp1eqf42AQG25LwSmqagSsxM2xoxBfA5UUrzUnBOoRrlSg00amrIyHflv8fgRgs
	QOTmiR1QqwH/ovyebtadupZwc=
X-Google-Smtp-Source: AGHT+IGzUXTMu6+0f6gQ8j7WPO24H14DLLXfhIDYppHhvCBnMdLnrdfvlyQcetDDzARbEXc2mLoN0e/rL5Gkqv0Y5W8=
X-Received: by 2002:a17:90b:2250:b0:2fa:603e:905c with SMTP id
 98e67ed59e1d1-301a5b0441dmr2305847a91.2.1742288138990; Tue, 18 Mar 2025
 01:55:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-4-robh@kernel.org>
In-Reply-To: <20250317232426.952188-4-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 18 Mar 2025 10:57:11 +0200
X-Gm-Features: AQ5f1JoW0JUop4WUBf11_vConfYpr4BhM02aAcWePKMPfEFMJ9UWB8ZNiBwcNWg
Message-ID: <CAEnQRZA7jEA0V4T1JSam-vV-GcBAbynP0PCfQsyejScwdgd3pg@mail.gmail.com>
Subject: Re: [PATCH 3/3] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 1:25=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
>
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For IMX part:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
