Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74105421EE7
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909460; cv=pass; b=t8aLj+QoglD4ifHRCHOYf/KIXND7LIXCUeSCLB/ODbhuo/bjjgV+kqi848Je1Qglw5E/vOTwF9iIWbID6CtGmOKFxEL7WHFNE1+syt3LzlSErvActru1MtnbFg0f28q2dj90Gn9w35ZyPhlu0O+ib+JLpUXgWVWTLavNcUtd3xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909460; c=relaxed/simple;
	bh=AUhavbCRTVZ0M2XesfwWgyVlj2jeTPMDpiBDidw3pYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRaGyxyz0ccr+duSCauW+uYpnkki4yQ3jmvOlamFXGMx3ajNBO7cYGqIizcCP8oCoVd2qBAGlaNQO2mKJef+Ctg7VJog98sgRoALdphjpAsQkzLPRx87DvF+Wh8IsbRB8XdTirCH7s2xXz4BIo5KbL5W725CVzjVvTQza9/tD6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnWJ45Ql; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnWJ45Ql"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-124566b6693so7068813c88.0
        for <imx@lists.linux.dev>; Tue, 20 Jan 2026 03:44:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768909457; cv=none;
        d=google.com; s=arc-20240605;
        b=FZVj+5Q6xnBAsmA2+jCoadyfiBf1XrXkQaJWZ+Lw1EyU5nAzKPLvhwjVW3E1xEqQ1L
         EytTBPSgl1QIJfoekfhlFpV1qMLW1FBzb7W72cchAyV9awMQUApoVFyYLTbP4nKVAPOS
         aj5cgTExBh2VK2SVH4nvev9kOQaOrMxTocWSHY0SCiysFXTIxLbM+c5CrOSLNNuqIA+p
         D4p/2I7WA9rx6Neaj0qVpdOpHxqoapBryf+c0SSSrntFUm7Fp/xW1NiMrduSazlGiHQQ
         eZ2edjgg8crL8KwJo9SVYhpdbnTt8yJcMbraIeY2XQv1m95IWVRfMl+xd3DhBgej+j2y
         g7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E86ZXdE770Xwovkl6IYgj3eO0oOM7/ipyrSNGJ5VLkk=;
        fh=0RwxW7o9MSB8d2xLaNvuLY3mI+2LKCbAcAMQRs1t4SY=;
        b=OBGGFo4uH8wLDOax8vWwvxYhx8ufqyPQDP3DcLRP64LBAsUvfTX1VQdNOQ18dYjHJd
         SZaxp+frvfqVVLm8VM7rpboiVlixiaaNtTLwc6z75GcGeNCZr7EYLFXFnZvF/1NwdLFv
         yE9huXMOlGZVG07AOJzqf3xQDC+oiqZdfS1xw9JxCMv6N1ct8fWBlhmDI6cLUmjUzrpy
         bVMC6wbctJMV4Lh4/stFJKAiqcNjw8WJp/VG5a0ONkannsTZF9tyNJZNgVxS+WcbUaaO
         5KMXbinFY8usFh1+kpzUThisNqLYzqTT+d2Gd0iWxqTbNx6noXAqXn9Nga5oIQYyBDAW
         J8hA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909457; x=1769514257; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E86ZXdE770Xwovkl6IYgj3eO0oOM7/ipyrSNGJ5VLkk=;
        b=hnWJ45QlM9H05kkiKSebXfVPRmRr5yJ58N+R7Ca4d73YrzBJuQ9Q0BYSjhfBlFV0Hz
         ZX+ZOd/Xqk+i0ybU3zZ5ajtdVaA/QyM3IKQWHOiqnohxVbwqz1wI6cKIaG6OFQot4FE1
         +ILHz1vTrTYajzzm3iP3FARNbcYRdYwYXlKQXMZBdyoa4NEEHaiBojxTqKBTuih4Ufpr
         5i9sohwZL0vc4VcoxDy3bpVkY/OZltcZQ3EZmDByVS3SRHowR6UbhXS+a3ZCKYO3n3rN
         LTAsi/uh1oxD4tMCFwIGwIQaG1o2XGnc//52MHcX+Sbum+budXtrt0mzodJDHOaSW3ok
         /q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909457; x=1769514257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E86ZXdE770Xwovkl6IYgj3eO0oOM7/ipyrSNGJ5VLkk=;
        b=oeghkwS8GydhEyyfwhfsA8dHhQEvfbk77NhmsSJBLLOHrWM6NIsxRIj4TtluxpRcSf
         nuzvWyoN30H0K6tAFA2FPS8cjJ5UdSznhKQnXGLZ+b0rBk0FQIHApeeMqCoaqxpxXroF
         oLC5ZcLRVU3F2c1l4FbwZ9wyXfIohXlJJveb5cwRZe5jrMG5HvKMU72QTT6uB3mtEKLT
         HF3ZR9RTiXz7sAFntRw//ZeHEcBzR6vB4w7EcPuBLQBzKMAR8Md9Afh+GFR1jp7qHaTP
         y58EYH2vtL7M6G+G9rWkpd6/q3st6Q9Kdl85o6605tQ7bzDl1JSaV/41dVONwPQsMpEH
         fqGw==
X-Forwarded-Encrypted: i=1; AJvYcCUt3qih+6V1E2qWQQ8Cg68SvW3OQoZrggl8tZ2JV1R9HrkMUtAU20j1TyBvxoUXscbx1Gc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyedCB9oGLtnEiYRWK0zQO2aJMUGM3ouszLurfK61UYf+kOm3Zi
	v766AMQKGoayHEv7dxjsLIeD1oWMsKbblWsbW7QviXrE3dMxyZTrG4fHlU7ABmnk+B3gwLWgf6b
	gTJv9MN3GPPYXwD8f7AGAWQxuGl33CnE=
X-Gm-Gg: AY/fxX6SbyGTxo0UUftdtqhqEvx5HwM/Xsp/bi/oWQ4GOUhDRGOYKHyf15t2yX39Ht3
	mFw3Su4Cq0Fg3FmmkaTkLXNhPwJKathw2s1dadaIJA7gJ28dnh6bo+ljUgOFsXk1TAWYvDKOkc7
	WFKmkXdU6y+mpN1PbbgADp9ajkV989wwwJheZY9G+eq/Cvg0EEXGcsXQfvjWaW+F0gRF+5jpx26
	/hxV+l93XWhIkh1dCEn/8Cb4aQ09t5o6n0ydxVIaSWzP4edrMNe/F1W1NufISEO5pxCoVHWcXHk
	5D00FZDBSnA5Nw665cgAVStMU8UhcguE+74lgOa7a5ypqUu1rvSI320pNFtP3bNKIQD4q8hgSKD
	qM4J1gmD3kg==
X-Received: by 2002:a05:7022:4184:b0:11d:e40f:ee69 with SMTP id
 a92af1059eb24-1244b380f9dmr12491059c88.36.1768909457416; Tue, 20 Jan 2026
 03:44:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120011757.1387140-1-hongxing.zhu@nxp.com>
In-Reply-To: <20260120011757.1387140-1-hongxing.zhu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 20 Jan 2026 13:46:57 +0200
X-Gm-Features: AZwV_QhZ2tV6-Vbghh15PVnUEIiWGUBvMJOKoCcTwI3NHHV2_Ne1DbptDmWuXU8
Message-ID: <CAEnQRZBpLxM289h=OoZA5Dx_pDdG6Ude2wam+sULb=www68uow@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: imx95: Add fsl,max-link-speed property for pcie-ep[0,1]
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de, 
	festevam@gmail.com, kernel@pengutronix.de, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 3:21=E2=80=AFAM Richard Zhu <hongxing.zhu@nxp.com> =
wrote:
>
> Add fsl,max-link-speed property for pcie_ep[0,1].

Hi Richard,

Can you explain in the commit message why this change is needed?

What problem does it fix.

fsl,max-link-speed  is an optional property with a default of 1.

So it is perfectly fine to skip it as the initial patch does.

Thanks,
Daniel
