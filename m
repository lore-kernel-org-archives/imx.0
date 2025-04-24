Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BB8221FD9
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495703; cv=none; b=Cht8fAB/xQ6kJ4ykzg3OcDJEZvV3w8/H4fyHgs0zYzLKuIXUYQCZx+9s54keFnGYg16KfWF6t3tVi/HpEkKvi4tO/w9iWXAR2+0AjYYxmdWwLiTAoQnXAowcIgmd7s9RfwkGowNd56UmRC36iKY74dyLfewMkCta6UTy97M4jMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495703; c=relaxed/simple;
	bh=3CXnS8upeLfS+v4WADg2CmZoMTXWci6Kc40+q19Trco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYCK3RzQzha48207mLFDX+uwvMEiTGI444/vXQPP2uFqAwW05T+swB2Oo7eD8ESN4YGScJx2KxTPMcRl8LUrvYuNrkdqWho8ABCRgzKt627He0ELQ6ZOHJAHoa+99MMVlXuy1Yn0ECWPdM1QZOkubraFRzJr5M0IvfzORsLKNks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gz+Iq9K5; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gz+Iq9K5"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30332dfc820so1074447a91.2
        for <imx@lists.linux.dev>; Thu, 24 Apr 2025 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745495701; x=1746100501; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaXXZf7VNdBf/2Zq+DhTKSGQQp1DT6ynEcUt9SkvZ48=;
        b=Gz+Iq9K5vHjBF4Xk/nTSuF9qWUKdsCisat2yi7OuIRYlHEV4PjaTufChb10c+2fL/I
         vo0sBaPgmgkh4doEFB4kVWkFLIloyb/Lh7xz5g0od8O2wj1tB2WK/Dvb3tMDGd1LBNTz
         96TN8y61ttGXFQspZ4nzL35t8UG3hogtE80gX2lO3CeI9m6RbUJ8mtMAsYMrfh9Bx03O
         h7mSqclEA5rjYxDIMf58daHYVhc+hBeHZUtl6bTOlJPD6uMquvyW+SDAM2UaLSDWAi0R
         UfMzYo5tpBV1S7iOEj2mzLjUXVMfHLeVMtsTRzexKj5hCnMbEbUj0UZ7ne35VsadjFpp
         dRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495701; x=1746100501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaXXZf7VNdBf/2Zq+DhTKSGQQp1DT6ynEcUt9SkvZ48=;
        b=Q4Pdi/YJnCWcMivFKL/s843JiI9/qwEYiELuGQCl/LGIVRjCJCh0IjgfhGhznGE36Z
         dHQHiTEoWtMdLUztL2k36GulSPNohv3rptklpf+onhHrgmgxhnvJdvGX8hGiDB7vCfUE
         GNpZ4sGVvM/6FLe71+wJqlHRiB07ls+hoQeeaXku/7acMeRI8Y6gRdL56RSNnoSTBTdU
         b0CJ/+RqUoDxg8IGjy7rI9cT2602P23awRaP+5Pvf9UBF39jD5ypqiLPo0NG5+G1iSZ0
         +/srt6pJdYFsv3+FkpnhfKen9ZpiAlVbZaYPAPlhyChrB6W3PnvccJl6mBPu6j+eDh8g
         K57A==
X-Forwarded-Encrypted: i=1; AJvYcCVFptIEZE0U0i/7BD9T458KO+mJuZ1+/Gn9SqrDnnQQmfu+8my26v2n2cywxDyp/uDQL/g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfqJfqJHGAlGIJdBiKItR6uLOd6vWl57o7InJEDYcq/ICYTdxT
	ZNin55Q0xnEgyuMw9sYUgh+l4vpEaWrAt8cFj8nGujEUCqxDKxDDzX/D4dyvJs6POWEca2Omm7T
	ANs0BdrPwYJW0DgrjvukdB8xGi8Q=
X-Gm-Gg: ASbGncv5szgSfCyVreingAK3SzJyJDWsHZREmAp/LwG/wiKxgQJ5GZdD03n8Bsa1o3y
	9tas+6aDKIa28K5XFxvdbNnbJzFCiKohTdhKaPXX+Mg4dSUljHsJ+eGieuyI+l3exhDBK0mNm9n
	7V+KcjSzrnVBwh0NTCyQ==
X-Google-Smtp-Source: AGHT+IEVr8RYTjT9I12iRuzsSclckx06FCkr+9NaSoiRz8ff4GmsoCxyYCjNxZ7KvxRfcH7PrtxX3ivBVdZoECzD15Q=
X-Received: by 2002:a17:90b:2d47:b0:2fe:a614:5cf7 with SMTP id
 98e67ed59e1d1-309ed24bbf4mr3357527a91.3.1745495701229; Thu, 24 Apr 2025
 04:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org> <20250424084800.105300-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084800.105300-2-krzysztof.kozlowski@linaro.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 24 Apr 2025 14:56:50 +0300
X-Gm-Features: ATxdqUG07gfeFyk0H8HmHqP2CBe9nsNXfIbkETttN_SCGPWAGkzvs9MFfBgSr_g
Message-ID: <CAEnQRZBQaYhPU+hzCLxKGQ+UmVpp6MEXDCU4QWVh+Od2mQ+z0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: nxp: Align wifi node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@dh-electronics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 11:54=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
>
>   imx7d-remarkable2.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '=
^wifi(@.*)?$'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
