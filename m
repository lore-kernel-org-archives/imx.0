Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D996E1DEFD6
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 16:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822044; cv=none; b=NMYy4JijFT1M5DbvE66HcStLMUi3rVgXeZJnRnv3WD3NI01JW4oUOxAXaIue5JjNpz98HyTtATpxL3W0zlHVhoiUMm86RTIQ9h9/1aUfoWvhJ4WihgbxbzlVVhksh+0qXiWQ44U6l1981AlmogORYHiXCJ7WMbHoIWXD8z6u8Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822044; c=relaxed/simple;
	bh=39BxbZJxzOc2j51sx2qrVfV5Kq0/9tpMcS2gikzPL8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZColySRT0/QdCwL+jyKqoN6fG5616L77I+3ySUipJCHTfGHsNFdfMQCNtCjnfGUgBgH2bPKy1oOn2l51GMUGe04oZs6HMBzNJfIFcyQyI1wejWWJep5QCse24g7SfEw67EO4oEg/tUGDTVCO9huChglvBO3HlUma67j19CmBQpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1aBvGgH; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1aBvGgH"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-548409cd2a8so9178916e87.3
        for <imx@lists.linux.dev>; Wed, 16 Apr 2025 09:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744822041; x=1745426841; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39BxbZJxzOc2j51sx2qrVfV5Kq0/9tpMcS2gikzPL8c=;
        b=L1aBvGgH9rRI2Aw9Vz6UiCrv/CXdWTHTGFeug0bYp+5yQnNdUJNRkvcVaEOwztrtN2
         S77rtEGRX8jX+E8MarRvxEuXQSoBehG9Dv8QQPCGG8NNcHEGXkALuTwMHjW4NnIRicUY
         cc58aGP4AtQgjGx2y/HjDLpCve9FQNwzv/O4CwnEvnAvwZjg/rj2WwPY1AiNL32Qi6Bw
         JpaoeNgBmV6vMuMvIK8ferJZI7TAjyXZjEWQyKmYPQuiIXBsby3yTmEzccBcO2QRCq55
         Z0hA7CPX68iUtK/uOWGUStNbbfS+YuMQ5/+c5FoIBvQ9PsBexnpxP2R7BZI3d5KA2u5q
         u2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744822041; x=1745426841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39BxbZJxzOc2j51sx2qrVfV5Kq0/9tpMcS2gikzPL8c=;
        b=FwOYIarVqUW9LxdugTPzlcRCZ+UJIih32xeGUtp4Nwt21G9aLdnsS7rVcRwA0+ZbEU
         K5+7gx0JkafaHanyF7rT6FQDzXGdVFhf17ckjxQ6Kh3vmK7JHLTnH3hRA2FPG9HWbmmW
         K+cM2bXhZW3eNnV20oC1bTfI7Fc7dnTnhxO7iLkGaRrhA5JNxd7697aOblBEjbGcDeTk
         7r9q3RwI3JJh4zkeZu5PLFU1g1871bdc+0cWSG/CyBtJOr6ByP2Y4C7f+qnLVdp04FSW
         UJFcpOintUibNeI4ZipBBJLV+5oA5BdXSS9K5gRhfCY3AsCYV8rUzWTSxiCkehCnEscr
         HUBw==
X-Forwarded-Encrypted: i=1; AJvYcCVi4RFLy7G/9tPhUYX+gzrQgworp2DkLYaEcmu4aG4Op9kVQnhar+N8nmrxje49XDF8pSU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Dai1zVDsxslIkEIyCfXXCIr2jHzI4CuXQTUWYH1kOyw4aHnS
	cJNVASPLsBcxGYPTBJBge74j/1/jRiFo4Ofuw+lZdPACTuf/ceSmWdPDx+2JpUgtH/0GN3AK38G
	2buByrGxzSEAJ9/3hF1p965kFx5A=
X-Gm-Gg: ASbGncvVlv/7eFAoSbyNfvNHVAVMhcs/IWyOicuNj5a7Vb1PymVkHv/CteX/W9YPnxX
	gGAYXu5RzXE9O+IJfaedHf3Pf+xOJ5W41SNE7k7dsHeX2lvdM9cgj1fDgwah8/uoGy1nBi9LU/2
	EsRUq1mD0pSD83vw/Gqto1iocGxDEmQ+uak9T4OPO0dwplUy5UZEC7jgsoaCYUZX0f
X-Google-Smtp-Source: AGHT+IG8lZZ6TzRpkafiDqZuJb6IdgkKcm718c9RVf9XNRQH9WAewHR/NAdfrRWL4fICzAbGf7ZhyLgzY9E0+gg7jUk=
X-Received: by 2002:a05:6512:23a8:b0:545:381:71e with SMTP id
 2adb3069b0e04-54d64aea47dmr805238e87.40.1744822040616; Wed, 16 Apr 2025
 09:47:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250414140128.390400-1-lukma@denx.de> <20250414140128.390400-6-lukma@denx.de>
 <41ea023e-d19d-40f1-b268-37292c9e15de@gmx.net>
In-Reply-To: <41ea023e-d19d-40f1-b268-37292c9e15de@gmx.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 Apr 2025 13:47:08 -0300
X-Gm-Features: ATxdqUGIOgXds9JKSX6cp4bYSDFF-AKiQ6t09fTbUcUeMyDb0_oZvm6DwfBTF4M
Message-ID: <CAOMZO5D+OZ6C02n4T3tJnmzJd9hTWtZA9o6-LXcFh-UmTdVb+Q@mail.gmail.com>
Subject: Re: [net-next v5 5/6] ARM: mxs_defconfig: Update mxs_defconfig to 6.15-rc1
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Wed, Apr 16, 2025 at 11:41=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> w=
rote:

> This is unintended, even it's not your fault Lukasz. NETFS_SUPPORT isn't
> user select-able anymore, so it's dropped. AFAIU this comes from NFS
> support, so i think we need to enable CONFIG_NFS_FSCACHE here. Otherwise
> this caching feature get lost. Since this is a bugfix, this should be
> separate patch before the syncronization.
>
> @Shawn @Fabio what's your opinion?

Agreed, your suggestions are good ones, thanks.
