Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FC932A3E1
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 12:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766059215; cv=none; b=GycI4O11WWjvMzPG00pEzA7thYRTRibHo2RybtXaXk4OhLcmv6J1508xG7jL+Aqgr09guLicca8LLYmgI9383PhT1xUbWCsHKEZEC2yHbTwJNmVqIVebhXdDszX60m5B0lyDlJn2jwmNLvkVWzrvYSeA66tLuFl8h1QtdEXEARM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766059215; c=relaxed/simple;
	bh=+pyjz2GF0gIC4uQXtGEL07yHCNXCChhlOIDqBuuupYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bccgOXqulT5/bKVtLHHsJIRoXirbQmr5mQgqMAP3QfENCIOHvMJFQyyIvOIlI3ayO8pqmprIZe7oeWhq8ghA2073Vnsb9D08Z3EjRvod+7VhvNvC7hkATJP3DDe+MI8OWDwc39jwbsTU81uOIgaJf169UUxghoK8gVl0Lq62tuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6YFiuCD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6YFiuCD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0d6f647e2so8577875ad.1
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 04:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766059213; x=1766664013; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pyjz2GF0gIC4uQXtGEL07yHCNXCChhlOIDqBuuupYc=;
        b=I6YFiuCDoqfJcHYaa9oG8hwsxAhTBifjKU8O5pA8bmgSRT1ppHcXGH7SavM/zbyQw1
         by2a1n5u3kNr71tkV2FI+w826vOmqhfGjZIKUUjS9ImTeCp24Bj7rJKC1arUJXMWK9F1
         BeScgxS5wTlxZohKPfTqGAQAuPs+XZaRTN03e8vb09g+DgNTNiK11HA1/7eN0nx7W1Nx
         BHIlRr1vziJyv/0o0hnUKIeSJSngw0xQ8ABLs3G5ujmGyXvKqxli4biZgXVtd1OGDABq
         PBYJ1E885jYg5nAxTyEXldP+1wM8FoLvNuKUDTfiJZUne9jkPIC22WfChQaTLoC8Pho3
         5x6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766059213; x=1766664013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+pyjz2GF0gIC4uQXtGEL07yHCNXCChhlOIDqBuuupYc=;
        b=wYfvJJk6XJ8isgo/x4k6Lz2LFB5bc82W1zV36BafAzx02ZbIUIRJ67bNVCdDWBTdtw
         +SUKEWhvabNegr87483/ZmB4JGdiUpeKbPNRGg7avvuePj3eI3cqG8vNBEGgW4pjJvtT
         7DlFiLsnoafkqPD39SL5EAJmx7PkJBxyEkuLzOUU3TPOfSsfLx5BwumbVyCwdzCeXrOS
         ujE870QAFK8LbSAu2CIV64t7QRLc8D3ZzqXm1Gg2qkTA37w6mv0pEWIUMDVSqM2Y62AB
         tWbweUdy6eayYRD2auI6dSKvbLABadY6YDX728pCkvvGLsW6iMUWbF+2YTHRFoBpQ5Be
         1WxA==
X-Forwarded-Encrypted: i=1; AJvYcCU2+YMu5/UQyt3+aopHrFgXJIMtl72o/+xfd7oZYzmgfXIQOmfC4uFC2N2t1KCUr6wkd0M=@lists.linux.dev
X-Gm-Message-State: AOJu0YywpObSBjyqyTR2/MaWDkiSi20hdKtV++zdOOSwHpgih/ut80CC
	2JWILfnDhzpxdCdQz15+HK1kjalU+ko85VgSCjWuYCFmC7RpOh1h7fkLgrh+OUDQI8ZoRsOt+K5
	y/dT/WcucBrN0ISB+9hkD8B0+1qVKD+4=
X-Gm-Gg: AY/fxX6F1+kewzyY1EMDGrCM8OQfChzocTYfQQMWYw3wiRrCz4aAGGJUXtuXpy9xL20
	N7GbRVQyqqHKtRg6zIwLC7lR3aLigsVBJ8/5xZuN8zKQg4ZqCEz45bwOWSnljIWT4O3xwDXi6PV
	PRIPmhEHtr8Ho4/csqpImjKFEneCh/OPylkWFdjd8WrKp7sLWGAUNa3DIXtoGaMzXQ0JIh0n5lx
	b3fhBNa5tfwP5bmDxC/XobHaDOUpfIhphQ39qpd7LqgM77iJXZcjO/IZ23vrx0kUkDC/C0xg0lx
	PC8eJ8XPhCi/MJWGtaAHECtCSPuZUyVJrCcCHhtI1dF7ycNzb+//6aE5s1hcaA6b7o9UP+IqpSq
	knOpDkdPchw==
X-Google-Smtp-Source: AGHT+IEqWe0Zix6Wkx51aIrnFSEkKHboocpxYspchquQYx//DGOWwsW+frZeJB4zp9WuH8FDmKf/6mzb08jXJSiJAa8=
X-Received: by 2002:a05:7022:f503:b0:119:e56b:c75b with SMTP id
 a92af1059eb24-11f34c2625amr13522584c88.32.1766059213253; Thu, 18 Dec 2025
 04:00:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251217-127-v2-0-67cb12e56242@nxp.com> <20251217-127-v2-1-67cb12e56242@nxp.com>
In-Reply-To: <20251217-127-v2-1-67cb12e56242@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Dec 2025 14:02:47 +0200
X-Gm-Features: AQt7F2rewN69JeRyCZdhBrwoHoID47vaOG2C7EKvdgft_btnuRWlqaA7S7bTuoA
Message-ID: <CAEnQRZCNm+8qRNCxW5v2FcEgKPRUvOa6UcQPrZWgC-ijN5+34Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95
 15x15 FRDM board
To: Lei Xu <lei.xu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com, 
	qijian.guo@nxp.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 7:57=E2=80=AFAM Lei Xu <lei.xu@nxp.com> wrote:
>
> Introduce a new DT compatible string for the NXP i.MX95 15x15 FRDM
> development board, a compact and cost-effective platform based on
> the i.MX95 applications processor.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Lei Xu <lei.xu@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
