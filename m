Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CDB3D961
	for <imx@lists.linux.dev>; Wed, 10 Apr 2024 23:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712792178; cv=none; b=tOmiwOx6NoWCGQ7VvbyVZXo2+vWCC7KIn2GoZS1Tp5XYZzwcug5C++UTGKLuDh8uWxmdsXQkgJkabqXlhLIkzsa+XtdRxp/g+K3myHYUPy4ZYPJEcFPjhO/mb5dcIvwnQKUKJGkxF5EsfYxboENmhwToIlYs9FDveMdFDk4BWZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712792178; c=relaxed/simple;
	bh=3dPS/Dr7Mm5ktn4AhoyjpMG4l7lmd7uF0848jNlQCkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXW7gzf0YqPC+TA6ElV9fp/x9DvZUVy7/AL7lX8GKqHSPAUpI/OMYrDDQ9C0jIg+ZBJKz/RBTrCIkwlbQfubsl5yCURvTkUH9V9LSoElolR5+BORwItbYxCC/vjzl8EYql9qLz03oRxvMN4UHSIM/abEAK5LVYdljuAqiSYp+C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihqawDdZ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihqawDdZ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2a2d37b8c4fso1838810a91.1
        for <imx@lists.linux.dev>; Wed, 10 Apr 2024 16:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712792176; x=1713396976; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCiwuhJlcdVymL9iabF0uqiMDb2CibrCH2dP3vtwOxM=;
        b=ihqawDdZjnz1yxMZ+s8urruBJQJCHxTV02LLCVG0DX22y83Sf6TP/Q4M4awrk/Gyg/
         KjSz+6jHg03yjgcgMi+kc07pJ/XrQ/P5X4e8b9n47aLfaNPhrn8Rj6M5oyB0zD8rCjop
         +sxbiLvd6G0+o8vt4OumhYjH4GRZZHSozNPeslDhX+okfCQXwjkqxCFjgXcJwz9iKUHe
         +sPPUx+UpWn/BCisVawN9mQOeBn9KbBUXqYTyYCGk9wu60hyNKWcW+FFRkogZq6SGr5S
         1Npn7O1WkIJTV6RoWnMnNdhdEXXK6HaG77EchuNHRr5PpUqZ3IiAmT8DTWgHSVm0w8cZ
         G+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712792176; x=1713396976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCiwuhJlcdVymL9iabF0uqiMDb2CibrCH2dP3vtwOxM=;
        b=EjFln3F5Me994B6r4jWXS1dvG9tAlZc7oHGTaabRWyRGtYAvJp6/O7Aj1/xLvGcl23
         xUJDCSZKXFbOaCiGjWHknLmritE7d4Zfflq1zJr5Luw3HjjB74jRjKzh9JqKZVO0l8QD
         qPjfc/Cvqz1MWulyenQpqvr2XyTE1rF4nYRSzZvcpePkKeS7Rt4dL2bUs9Ipn9q/PSoV
         FAcCvbbW6MN2xkSu6soy8D2bJdbeVyBlVkKckJOteMeZKIwnqmRfA3b2u/SuLCFPQvQl
         5QWaZAxfchsIjBt5luNsqVXmIsT9yutkei9Ag/som7XWNsu5Q59Q1WLnPugox6pW3k1k
         8pdg==
X-Forwarded-Encrypted: i=1; AJvYcCVA1TYgjvdrskRU0tVMdcta+XP1mmGmbbYmH4y/iFsYXurGX47htiSTEQkeGK4J2DixLVjZK/XlX6L+eRJcaREmwJU7
X-Gm-Message-State: AOJu0YzTq470ly4txsGPbMq4RyPhSerxnD6sVthZQVr03ibIpbCcPamW
	MSPizBYzPzOxGEgppl148U5z6QPCIndYj8RQT4XMczGCB/qzvMeyoNRSMu1MMcopn9ZRdA80FXf
	x8ExoFdgm7dc73xJJNOHeJ8zEboQ=
X-Google-Smtp-Source: AGHT+IHvxfBW1enUR1DnNYuaYxnKs9tO+hdbg0i47Qw9mY6cM7ho7vYbzxgiD/vaxzb1WdMzDzxpTGcfy4AZCrqiLA0=
X-Received: by 2002:a17:90a:4688:b0:2a2:6757:1de0 with SMTP id
 z8-20020a17090a468800b002a267571de0mr4070054pjf.4.1712792176144; Wed, 10 Apr
 2024 16:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240410170150.248428-1-krzk@kernel.org> <20240410170150.248428-5-krzk@kernel.org>
In-Reply-To: <20240410170150.248428-5-krzk@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 10 Apr 2024 20:36:04 -0300
Message-ID: <CAOMZO5DFr8uhVRq8X+ZURCCAw4bLM4Ueaerr-gw554sFr+KLKw@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: realtek: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	zhanghongchen <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 2:02=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these

You forgot to complete the sentence.
