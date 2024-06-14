Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644FF7F492
	for <imx@lists.linux.dev>; Fri, 14 Jun 2024 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718362208; cv=none; b=HCgcXZHnAts83qqNSL5SZeyAV6VJ/jB5OE/hBzypKDWFUrJkRlcHQ2ygAQ7YJuqMnGCfHD+EaJqX9P1yYGvrsMLSVf/+MC3PB5D9lemOkxZ/tJeYgYvOrH4SqHARYjhMlajykqNjxg9fHmHtvugY59Ly/SS5qu4RG6lfMWhPevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718362208; c=relaxed/simple;
	bh=QXp0E+fwmVtC+dLdV29MGtpRInQu8wHVNWt3UcAzTaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwNibRdrCMuKPj5PCaqK2HAFVHe04WZYxBG7wkVOukrWGIBYcnBSmkA5x81uCYBIPST6gtMF1dFmlU3fu7d1w9gQFmbVJpWn4NYrIQsf4XarK2HM0DT8IfftLNDqeBDXyvFOpwEYMPqLMiH0RuL44FE/0++k1ZM2xjkJBuSufp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/xglODb; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/xglODb"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f6ee1b4414so1575155ad.1
        for <imx@lists.linux.dev>; Fri, 14 Jun 2024 03:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718362207; x=1718967007; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FN3vsCtnCbhfEWE7YOMqnwUF4qxuxOyYlc2ZbCQATK8=;
        b=F/xglODbIq2/R6ewXKmKAtN3eikB0zoNdwASRiuc/+BfRMZw+MLigm5lLBTHMAD8mU
         /qkERXFPr0T/U9BbLWUIlEHWAGjdYf9WjOdJp1FDR8VHMwIjpM61s1DQg1Zkpc5bTVJT
         zoOROpfZERRHYIEMRFn6DKktAxMBIGNgKPZVD668klUI4dVhKlibBIVqWG0F5lxS79tm
         km0ssBI75v4fsAjPYReQGTV+iq1eBrwUTVHoWefIBNiknH5ughyMfhHFQlOzN/49hd5+
         CS4VSg3ToDqdukiOqG5G0K2KTrjNgj+WhhAJYZatNqHa/RuAUNnTuUoL0YsfO0XocWWN
         0T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718362207; x=1718967007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FN3vsCtnCbhfEWE7YOMqnwUF4qxuxOyYlc2ZbCQATK8=;
        b=MYXIdm35/JOxIIVEKVCj57h0PrI0DwRthjCHk/a6znwb+FU4s4V2jwsRrS8ijBjzfZ
         rjg+BjWAZ18rmeBy2t/ou3wNwOutUt78eQ3PNVp+ZGJXeIcmG5yct94VFHPAr6nwuGCb
         vbbiVbGIZFRp//RP3ZnJLMRLbNMWDdmqBuKl7Cj0CBPWhdmGwkXBWOSlCCvHzyxCYW6M
         /3dk4ux+SDhC7C6Wlvw1g2w+Y6Rd7ypbtquuNWt9fBQFrLa7J+g0+361ZALSnDejSFZM
         KvYusQ2CB1QiNcwTikQ8fZ9Sh/ptqNwZH4gsek2Nil3uHFmOPvfgdK/6POAdE/GGErj+
         n5pA==
X-Forwarded-Encrypted: i=1; AJvYcCWEJ7qIT/K6kuBvESBxYKXXtq1qc6X39BSrWwzYfD7Y4kfTeveNZ5JV2hgJROga68kY/KawABto6fNpRwmnuRVTFQsg
X-Gm-Message-State: AOJu0Yx9Nx61KxB/I1715PvTviD8eNvE5c+/YhCXujH3y1djha0k4brz
	p7bQpqpL66Snl4459IkvE9GFUThoAL44eqL+2JlB3uhZaoU/C0Z4ho6A/jfzr92GlUoTp4SGv6U
	SS+lwIfxz4cTlOFrObsagJqUqWHc=
X-Google-Smtp-Source: AGHT+IHgArd11Sr3/cVVDrQnQwI2RDLcgIn6oK4LnKR6wQe/sXzVwQkyN3JryAftKxLHPTfJ0mLrINTYXizbakdH1hU=
X-Received: by 2002:a05:6a21:9988:b0:1b7:571d:3d02 with SMTP id
 adf61e73a8af0-1bae841ec0bmr2723114637.5.1718362206628; Fri, 14 Jun 2024
 03:50:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 14 Jun 2024 07:49:54 -0300
Message-ID: <CAOMZO5Br98929LM-r8YnbFnPOUSusamMZoaMDvEHYBSmSqhGhQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, Jun 14, 2024 at 6:59=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Emails to Anson Huang bounce:
>
>   Diagnostic-Code: smtp; 550 5.4.1 Recipient address rejected: Access den=
ied.
>
> Add IMX platform maintainers for bindings which would become orphaned.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
