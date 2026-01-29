Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EB4346A07
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 02:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769652461; cv=pass; b=Uz9MZxlZYepPLtBBPWFocv9Nbdn1/+qQVr4yynUPqcnBE3EHNiKXqagFbdKRGtYrsLu6tBVBasj7ji4bgH1aUHqjtY/AtqXDXoG1gHs3ZjWBrQ4urpAskBL4IpZXTudEA2wEskxiDkgyGDMgt1hIUsUCIiuT6+jC6QAmPSCk/Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769652461; c=relaxed/simple;
	bh=oDVuCZ5Gx/glBVCpME6YGkCQ33hbuczk3pr5ShKRnqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVTjRr3kSVmkH8XHccdnjpr4cvXIEI35Z9DmMAD0Nl7tr+D7oiMnks+OPi+4O5c0iB8ym6qRQu6bhv1gB7Nmk8j6W4p3axq19aNyt0jzGEPwgyg6LLisGRRb/Ps2Zk0PLwr6YzRgxbi4hGjEs5+j9AsOgleD/XvND56548B4ByY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHZQ/lXB; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHZQ/lXB"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-81e93c5961cso399398b3a.0
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 18:07:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769652455; cv=none;
        d=google.com; s=arc-20240605;
        b=YMsURn7t8qxpgHrIPTREEMDET2u3t3rksVLWjTeioiEoIxPdYPZKnvA6Z54yCJPUhU
         s3vXxZ1NjlmWgQSiao4IK0GOlFUBUfxBrDqeNvFmtNrIktimY8ShnG9wAmwGa1kRnNku
         drebdoidZx7ocxM3h3BtZB1LxQOMvut5IfNIwtv9zG//6he+ncLA1ZLVTSLSCz1KeK0i
         4WtkS4k8T6XxKERaKa/0wDmiVd7kJpSxBkBnfzIlWe0HVck34lzLxoGtkLBMvBvpuDUQ
         /vOnFLWslEaKMaqs4U/bDueOTpEbrIFUleDk0e3qF87NNHlJFtyHhwsa1PTiaA7ObnoH
         DOtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=;
        fh=sj4SKib56gq59xpUjQ6WaZwKa+BIYkXC1VMI8bVpr/Q=;
        b=TmP02F2uB7tix5IgsKmC6KZNbevjy8BB4GP0JTf82thI2lPtO5qQyFUsUIF3BVqpH+
         TKxWfAlhJ2tLkhfH6V1zV/o6Yu98dq+lbBZKgh1H7qNTzW9eR8d5aP1twQqQuMhqmBV4
         oCSyUTQmSzLOJVxvI/ATdOUJRA3xP1cxvtEud/Qvd5Def8juSgh+PcGfaXOCjVH9pYHB
         KGlfGTuGPbw6bxrm89d6z4es3N0j5MYx63E4Ek1FjOTG83EQg9DSlOXNZBwBGjHm1CXf
         Attu6k8ASuRtf+PA/qvD879Uh06tauDqseJ02IXQQBlHCGSNynzr/Tao1lkAdKoRJhTe
         VBiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769652455; x=1770257255; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=;
        b=OHZQ/lXBclJDPsbCVlVFWh75/tloiW1G+8vHoXAwxhOmZvMO3n9gFFHcLPTsllqnre
         9YgZkMzCDb+IjOwOZxIokUryK6UEglZjJEiKIj55fzLz3RHzdgnjqcrzE8wurQS+QGlN
         PwQFyzdNRG1IGDZzXIR2W6gOVJW7yhs55qK5Vlcxk/39cB3tyxpyshdjRVK3e5p8jf6n
         PQDDKqaeJExg/369FyoT/EtglEIebK8S0pLYv7dMnm0Qtyx4UMKAljboIDIepFrpFNS2
         srpGzdI7LVWkiPx6CXmZ2wz4ZKCMPb/0+WbRV9x4yCEUj6jzNGI5JED+Xn8YfgtLJU+J
         yEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769652455; x=1770257255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=;
        b=SkOO3O6ZMR3V/Y3ThUfuWivsQJmGhRhLUz3jd8Izx5ByGxQhBTmv4ABtprDJGfG0xB
         hiqk7tePinXUZQw+3yUzBoOzF9cXzJ8CtxeK1kqdC2Sn+LNIkqXx3rlVvFI3cuaOTdnQ
         /0EbW/x7FcRq+OhcRgyJ15z0hmjsWL0NwCyYpUn2DTodfMq9XzRwDLjTFkZ0SY1bORJ3
         y6yrOwmh1/CKxDaCowtziLyrpbZcBON/fzUouecA/aeYKTBp+1sb9vd3eeJ4xy7N4qEB
         1TZb61wWlZrnfhcAzmkW9+N2vUmv+kQ5BFUut8v/BIB/3/FLI8DSsRElbgJllHpm6ZNP
         Op+g==
X-Forwarded-Encrypted: i=1; AJvYcCXlS/9hBixW9Un66eWMn9TaS3b8VClYETQqoy+MX3GIPDJk6IA9x1woE0XkUV2pc5NdKpw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkc/Z4v5Jecz3TnRHN9lV9O3kqM0e+eZuMNbBq8tu4bfA14RVU
	hUGy3NEfLrVXwYlIMf0UNWCVYedEV2ua4Ce7siAhZ/GLlywyjcF9ZjAdPg4EuTiS+vELmfHdXJR
	ovNhuHfp7maRPgkB5AKEFLikWDxVpPYg=
X-Gm-Gg: AZuq6aIx1FUGU6fsi1q9Vec6WXzyZ1hki/ZW8y4Y4v3NBBgmIXh6wr/2oOKIWNLJtFg
	43p3gsVSHbX+LG3bVD945+TtVd9CfeDcaBGNFT+7se6L3jbCrGxY2/vZnc0/UquXYhuLs2HpzlI
	z99fTM9tdd/ttTKNHWWcs7K2OXdxoMbENZLYY5RdVDkKG4h615YquOTSLZj0p2Vt265zUWMCIGl
	Q5hq0LqambRBq/6G1vgNC2s8PBPYAY3coau/FGtVEYjPABcPqf5VRJfwlYIffdk4hG1k+A=
X-Received: by 2002:a05:6a21:9d8e:b0:38b:ec0d:51ed with SMTP id
 adf61e73a8af0-38ec658522amr7340595637.69.1769652454754; Wed, 28 Jan 2026
 18:07:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-2-shengjiu.wang@nxp.com> <20260128-daft-rabbit-of-abracadabra-fe3274@quoll>
In-Reply-To: <20260128-daft-rabbit-of-abracadabra-fe3274@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jan 2026 10:07:22 +0800
X-Gm-Features: AZwV_Qg-rrUV06PleoYM6kICczpC4hfgzfJ0lPzEIvMPV1d9IUOkAJEm-OUeTRw
Message-ID: <CAA+D8AMb-QPuqXfb4RyFo-9WTaH78WrAnCGTaS3DGXBP74DT6Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,imx-asrc: Add support for
 i.MX952 platform
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 7:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jan 28, 2026 at 03:18:51PM +0800, Shengjiu Wang wrote:
> > Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform
>
> We see this from the diff. Say something useful.
>
> Also, why power domains are not required?

Ok, I will add more info.

There is a power domain on i.MX952 for the wakeupmix system that
ASRC is in. But it is enabled by default,  ASRC device don't need to enable
it, so it is optional for i.MX952.

Best regards
Shengjiu Wang
>
>
> Best regards,
> Krzysztof
>
