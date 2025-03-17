Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8FE23E344
	for <imx@lists.linux.dev>; Mon, 17 Mar 2025 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218486; cv=none; b=TiOTGIfzFgMqcPnoidDqhStXW0MeRljnecTWrTRZrJIr0ERJeUEn/N3H6zK2ss2Z9C9c/ZFgpM7bGPl0BZVKV+peAnGrbF7Gt0oLMcaGGh7X4Eyp/lzYeWhAbDEl0tzyVNr+uvxS3rzKXzSo95JCqMmXtZsvDy5WO5C+ds/Vk9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218486; c=relaxed/simple;
	bh=VJ+Z1kfUBwbn40YbG9rlTaU9zO9y3+iqV9Uwb36hGeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFd0/TMGcDqzLXoINaxUNgnnT92vex2uIbtrzJe5vUZ27l9rwXpEfyCXE5B2CVKjvM6omcObhuqS0ANGY7XfdSyNh5D5u4pWFlP/7zbJPSzrqBQwJYij5IoqIRdf+dU9alSaZeiBpQWA4PWcr7MZtEhK0MnyvU9q0aeI1DlCeTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVyO4+ke; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVyO4+ke"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff64550991so2356379a91.0
        for <imx@lists.linux.dev>; Mon, 17 Mar 2025 06:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742218484; x=1742823284; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJ+Z1kfUBwbn40YbG9rlTaU9zO9y3+iqV9Uwb36hGeo=;
        b=iVyO4+kesEwGD13QL4i1k2CMhQ4a4F6uqxznXz0GdWUkYjXQD1wvoJ4NhrzIbuCzMH
         KJzirjAzpjzfAiQSeLE8FJP7w4Kdv1q+VnZyEq0khdZxJWhL2aFJw1LvB17NT+HXSv+/
         GLdQO498xNJl8v7swbsiQ6MpVZqjv+RCp5INnmsvOJLHOVX2b0EOaDHblGboPA/lFWRY
         7hZtfR38hKFhTleWSNY87mJzi7Ok+gLELZssL4lTBe83J8jdMRtCqI6K9vM7/eTtLRtT
         Xo7iovuMrAWlcLrQ5KeEE184m0fKBPLqetvfUU/7NJYQDkAvCNHm+oVkczq0dJ3BGzOj
         jhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742218484; x=1742823284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJ+Z1kfUBwbn40YbG9rlTaU9zO9y3+iqV9Uwb36hGeo=;
        b=nUWIFukDlR25vIizRwacYjaCq45BNk1vfh5G1tQDucei6tkMD7EWh+JZzQNJ6LC87c
         SwUK6Qv8AL6fe5HZa8IwG2mi2P4id6RVDw3GcrhHiGlel/DcllN1Ad4hMN0G09wwxy3W
         ZxZSDhkkgFXjot5hUVU9gwSl3qV9LlSqgtz4m5489vcU+iZo3UAyksKFxkrZGajIpwR+
         y6nA+UuxD5xTn8LZYvvR9qthBU20YRPBP1pLrg+k2i26Qj5KrqoqkmT07p+wnOR3HPkX
         3+QJqW5Tn0AXWe6uDN9YtuHHQ0yHHUIEfWGqED4ZS/gu11QsUO6P+eiC3My3c3gwOqlq
         gzZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTw7bcJrczJw2FLIZzOlTaJ9s8XpNy4MXdkyxnWf0jKjAA1bz2mnFjThZCcJh/hMMorSE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMrtlX1VhVVWl5wb0wNh7DTUxCBahFbYHd1NGAXwF9x1Sx2/8P
	CC2jS2h2m5PgiizXc+MyrYuTH7a6gsWJeGaM8Z0UILx0XUafmJF6pCdH6pwe5/etyVjX1iUejEA
	uhj8+hSBIt4hHNnaoYvf8nHJH664=
X-Gm-Gg: ASbGncvqicjiHxEQmzCOQkL06QRmHIuaD+hd46m2xdGtk9M1qBvCx9+wEQlVOATD3jI
	FQwVQNW+te4tLTeurJarluT5y8lIWH3ClyMJQsYBRwrxTMsyszriad3AjWka0pgaRZPQzAYcbWG
	aNo6CW+3kHCG+bGpU2iNHRVkY=
X-Google-Smtp-Source: AGHT+IEeqZ0cJAHn3Brc0MOsXlDdCz7IeLznbTYmwKzft6JI2zwV4TEg69VCl0Ay05c5C9QobxSkS+DMqCY1QxY4NlY=
X-Received: by 2002:a17:90b:3b46:b0:2ea:3f34:f18f with SMTP id
 98e67ed59e1d1-30151ca0bf3mr14263755a91.19.1742218484066; Mon, 17 Mar 2025
 06:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250317111853.43708-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250317111853.43708-1-krzysztof.kozlowski@linaro.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 17 Mar 2025 15:36:17 +0200
X-Gm-Features: AQ5f1JoJB5F4azgy82hI2MMZ6wYjl0ACVtNOlaZnQbewllSkYy5wctWQcui4Ius
Message-ID: <CAEnQRZBorgPS+P8Yt8irKm=CTpbY3hUdkSpOK5if5xaTpzikuQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nxp: Align NAND controller node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 1:19=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Bindings expect NAND controller device nodes to be named
> "nand-controller".
>
> Cc: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
