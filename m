Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792776981;
	b=JGe1Yg5+Tw9NUcpYA4WLq8dEpEfJl+jh4xpNAnLaJRRDJZleTaGG1TYN1MFYMKGKUDpr
	 L6x+EyeLOJ8x78nWdhjxC+WHznXfnr2SQz3FqvKuDtG2Ga8rZftNu5lQF7bJWg5oQd608
	 /NzGFe7Cas/AXkxWRE7PYEIYkHP6vrnppjRrqXi6MyZwHFuW+DshKdMoNFzTfszqR91iv
	 9DbtxyNJBTLEdvM93EOri4ai5j/Q38ZF2R7AUUHUpehvNaYbd9oBOf+T/j1IdXoKGjZHn
	 U1il/beCFwKu+snY36Ux/nJbrDyLUH/cNOyPHHmSTZKGYljbeT0Tj33sy4Rw6nvgZrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
	b=ENIuHRPomDyB5F+UFZ64ZVtIYpw5TrbYAJYS7XSXs2sSxLS9n2W52s277TYFxDRD0TtJ
	 F44shkr4jVmm2Iyb/wgdBTBLecwYb5boNqEgUZn/bISoimrTTJNst3Y8HoRUAV5E0cJGC
	 N/bg7krOa5ssqERMWqcAlUf4Vy6rthKKM+sB1jfA8cwTOdvU0QczrCw1Pm5SHgPu+AuJ1
	 x/XRg+pJchVbbfe9ZsZUCocN8TUVi0LghirIcI53h0B232EVwL26HJrilByljd7lrITBC
	 FEmgngzn4/QJhWyQwIASf0JCtaIEJLzNuPIIA/69c32rkLf0J3oB5kQU0lQyP4q5jJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pqJji8dv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CB5606A31E
	for <imx@lists.linux.dev>; Fri, 23 Oct 2026 17:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90CB5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pqJji8dv
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4395d31228so175808166b.1
        for <imx@lists.linux.dev>; Fri, 23 Oct 2026 10:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792776979; cv=none;
        d=google.com; s=arc-20260327;
        b=M0vsF+ZpQ7ydkZ4y5EtjHN2jCXaOtNrXOTD7GU8WK4Dz8yZCPnDN/4N2Jra7KUfjGE
         4razDYDyWklLM8PUYttCTGR8Eejns4MykbZGfkG0+5B6fUrf2+E6uCg8EP5nyA/58gGh
         FyKRKn4kBdptP2lGdUBQWJPVdN+KUuiLQg7LouuTn3KG3aPFoDWs5XX0JoUBZcQEkTmh
         Qrj6gPkSq0G8MVD8cAlng/2p3fXzGC/+xjxL/4RgQzpECwgl6kVk+UF1bJk8nsQF5O8V
         SOWTD1NV3dV37wCLOIK2UIFEQiX5/QpfLU+s1fdVM+ayTCN4nnYC7M3hnLB7MnOxKXtP
         TcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        fh=5g9gH35C2iyZF2dlnsqoD3bAn5S+E7Be3ynA3emwoyE=;
        b=gbc02AbJU0Usz6HMoXhxPtWUcmyUmbWhpBQL8SNTH65aHwPN6RmfCNAgw/0pVU9dV3
         ydx/7xDMchgK8r61OttkGqYNtBq/rQyEd+C1Pu+65nwn0NyRwqRYZmyJWUK8SkZw42ki
         azJehey/hQ9JuBgOgC1FTGeI44TXuNjIzk89iK5hFV3nUp7mliDGktvKyPuFVjaV7eAd
         XQNWk2dopfDkJRQNhX3IfMZLfhtdEqbsRBvpHseL6BBgTTlvWqN8RslNuKwjs271kiir
         Mu5nzmupiLLblvhSswjApfTN53FDLxalk60K+kFBmYEczjzuUh/B/cw/nKOp/xFMI+pF
         5Y4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792776979; x=1793381779; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        b=pqJji8dvn/ziKaiQDfoOfHZSQGsA05WurFddNchTFOdwAlov9zsZrZVLEz1/ZF7OS6
         yQidPeFAhd3iEn04vHGSEaJ9mIZvxRnDm5Q2FlTpbNtfd/PndOkcRiSWJHCQcYrEJJHG
         9yryJA2LnVN1OJCQuzRZts+FspKY6+/0cm6X4XGqQPEEEATiu9v+URcfifPHFFEUgX3a
         uH3qptKO0oaUygDPgVFzkCLwTH3LWOqD6OCXpBNUxqZPfBY398hv1UdD1J/s3t3bIZvA
         PbQSKMWIxRZVFKJ4vvD35qALGmnNa05irMsmAXI1f2UjbihDXA5yp2bBetPKeYYC3zXn
         Disw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776979; x=1793381779;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        b=ad4GwNcZuuPtqI9MzRb5LLRuVYc2LiFn3hzsVepxUjgTrQtsdOVPNEz5mfOeFXb7zC
         H6spP0vnKgrG27Lqw+T9C88tITodDtoURhsN5Q8i82FmNwv8AlKYLOhhAbwIrgtU30+w
         otuRJSk49lF+fOmC65wjFH6gshGWSzOEJiQ4DCNA3aAj7pP1PSDLyV2siSMYkfTZq6Ko
         tVoJKB9aKk7WqTrHyzPVHJNH48niFYLTDUJns2eI/P3saMSR5qhdcgZEVvPy/kQp7E8b
         W8o5ZtySm808237gyXMXGsxvpRhLpOel+JW2MT2VZ/06jvJr0jilOSWIhzL68EUcyidu
         D68Q==
X-Forwarded-Encrypted: i=1; AKwUvBw6jyZ40sBJg0Wb1Lmf7N2p6ndihXCV5yUaN3BgwiZhdrxb/7cAqjOmS7uqbOlcimy4DRY=@lists.linux.dev
X-Gm-Message-State: AFq9FYK5t3ZzeAqI7NqMZndu6OVjva+5t6dfro/YsnqLTujaGbwMcgLW
	mN/n0NXrB6819NewX8zmULSAPDvPELK6Sl1ba64t0fYreyNo5HKccm2C77oxiM9jeWDA+OvvzOc
	TuGSeiswHWKaOhxNm7zgjZSW8eaCVwnvW4lJLH2HOPQ==
X-Gm-Gg: AYBFou3dx3V+ORcmRklWD6CTx7/dPV+n4X2p4nDat8aYgjtPrc4ygqG1VUny0pdMZga
	RJNPmaZ6/zpTUt9fdlTTe5PXziOPraYW33CCOxruRRMKqQNG9omi3mioKfbNIodIKv9JA5bKBH0
	8chMIG2hh4Xxw0c8F66KEFhtSuMJ51itj+2CXswwz/ws5nPlc6e1ZtfTLA5JWPAPJ2bWRwPvXm7
	PoJnQei7Tiukd1v8wj9o2IpRmUG20b7hOzU3W8aBjfdW24bev4vvT1Lx1XM6w15LBkPW9VazgFI
	hczYVJ+bl8bJD+KD+yyYhYiQqq1pTS3ed+17NrIlGHd0XLOlhc0giA8O7cUzBhBgjzBJzan0p43
	0hM3adk7q68DscS5fTM2UZy3n66wRUdKNt8yNBCl7yn/bSk4KjQ8JcIJO8YcyamZuIuJ4EM4=
X-Received: by 2002:a17:906:f595:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c46a8fd5c3amr423797666b.14.1792776978822; Fri, 23 Oct 2026
 10:36:18 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
In-Reply-To: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 23 Oct 2026 11:36:06 -0600
X-Gm-Features: AclHuK9m_F_bGO076TSrsT-kULx7SuWcQOcLAgoXUR-ZcTiSb4Ix0VHIuC5OZJE
Message-ID: <CANLsYkwTaeuoKWvCuK-4ctLa9n+7xCJe_yo_E9mDZL8ddY83DQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI.
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Francesco Valla <francesco@valla.it>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 13:05, <Frank.Li@oss.nxp.com> wrote:
>
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI.
>
> rsc_table: rsc-table@90000000
>            ^^^^^^^^
> {       ret  = <0x90000000>;
>         no-map;
> }
>
> m4 {
>         ...
>         memory-region = <&rsc_table>;
> }
>
> Current require node name have to be rsc-table, but no any binding doc
> to restrict it.
>
> Since memory node names are not constrained by the binding, incorrect names
> can silently pass DT validation, as seen in examples using "vdevbuffer"
> instead of "vdev0buffer" ([1] and [2]).
>
> Add optional memory-region-names property to define such ABI. To keep
> back compactiblity, use "optional".
>
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
>
> Prevous version
> https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/
>
> ---
> Changes in v8:
> - remove dev_warning
> - remove dts patches
> - Link to v7: https://patch.msgid.link/20261020-memory-region-name-v7-0-1413d5928340@nxp.com
>

You have ignored my comment from [PATCH v7 0/3] so I'm ignoring your patchset.

> Changes in v7:
> - move imx_rproc_rmem_to_resource() close to caller
> - collect Francesco and peng fan's review tag
> - Link to v6: https://patch.msgid.link/20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com
>
> Changes in v6:
> - collect rob's review-by tags for binding
> - move imx_rproc_rmem_to_resource to c file
> - dts move related memory region node into overlay file
> - Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com
>
> Changes in v5:
> - fix binding region-memory-names's pattern
> - add vdev1vring0 and vdev1vring1 at dts
> - collect pan peng's review by tags
> - Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com
>
> Change in v3
> - rephrase commit message and cover letter to correct descritpion and
> reasons.
>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> ---
> Laurentiu Mihalcea (2):
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid hidden ABI
>
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 ++++++++
>  drivers/remoteproc/imx_rproc.c                     | 29 ++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20260915-memory-region-name-f950eea2b78d
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>
