Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70C327FB2E
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425787; cv=none; b=mOMXIn54v2bswGaMOc4C67hrn3rfJdOdkA2f5ejgvbe8M2SzMLI9AVIHHwnBcHmrfdkJeHFz7R1YjLsRAd/8/s5YPH+zC56DmGNle+Wi8SaYHLHFsAzD1q+XUTCT5YBCIBQj0lrgw/B92Sjl5qCzoI3F+jHo5xblx4URjltzpfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425787; c=relaxed/simple;
	bh=vVbVRFQUAznwYxpCtzkO4d0c66o8bC/lMZQmfZTPce8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VINNoCroEZb8fzH1GACCjnsdpoMGMmyWIIUXB5h+6iZUNuN23+ffK5QKFPKaJA5rNwVFitHzQK2A1n8c4vFS25ukwf8KuWWlJaPbMrtqPbEthF8nx2jZekkQEC/48C4P2Hohp5Na0/uf8YbpiajRvQDgWWjONCz+qpd7tFVQzAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZzGCRSP; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZzGCRSP"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-31329098ae8so1548634a91.1
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750425785; x=1751030585; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVbVRFQUAznwYxpCtzkO4d0c66o8bC/lMZQmfZTPce8=;
        b=iZzGCRSPG/e577JXGEDTibWNiwBe+SPLy0HLVHsNRFer2lW0xcRATpmHyTyVGUlx/a
         yVn5vmIHpIKmnveK9EUaURkxE1o8sTdOvC2jAmjllbrRSVUjMAhd9lsqoGkNxwlvS83Y
         8yPAfqeUP6oO9UOyDXAgJ9zwU3d1jLJHH0zKFKZotTn4S8okX+MGk0KTNZuizdtbLqr+
         kgQ7zN1RBNXl+3M4Koavu6v2xUbGiSYmAlr+A0QRn4+uhiI7uf6YkTHw9ggC3WDtect4
         5eRbWNA6fUxDLBbvNjDMgSUXVq9c5OiCSfJTQIou2/t3dYFrt7BPds68XpcBUZwIO2Nv
         E5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750425785; x=1751030585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVbVRFQUAznwYxpCtzkO4d0c66o8bC/lMZQmfZTPce8=;
        b=sZVqq0Fj4sLMbyNAByNNLUM7yquzcvP15ekvMvq2TZIVypm8mPpW61W0pA4p9jNJvi
         QK+ZHV8/Khgqe8NsOvvcehCF9KmszWTd6GxA/6GzcuqRRe0Nx3ZDM41HrRkQbrdty/aw
         EVeyjptickoPdxyWpTPbazaR0GVIV8tC2JdyDra6ys6Pr63AeGKHGImzv70rWcNx4Z55
         +35UWoAcNgCPgUNkOU8SnGI80Ck3p4F4tZnwopepaJJ3FexTyZ5pkA4ks4u06sG9r+NU
         yqaegLbcs0JmvY+57gG7CimnhgCNVkDXgEyPmuDuBW6zKmLhnd+k0Gzf61JW+s7e4is7
         vV9g==
X-Forwarded-Encrypted: i=1; AJvYcCXIcAiTwnV9OJET8e4iIWnzHZFjx9ptKHlSyS4roW7zxvYMlcw1klglOCAx8HTIfzUZsuo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+bnAVijhnGBMjtjr2O2AJLG8J2jRBVZSPWazkYWmWJgOxgtxv
	D3ls6ugLEZoDTUTzx0GsJKzhJmggg9JGw8zkHpbWMQ/NOSMfalQAf9KzLjIqyI4Q3AXUBOl69yB
	AWgeML2xFdJRw57kiomXxpe1YzGVsInA=
X-Gm-Gg: ASbGncsJwsul7x5+EVInmRU7mmRvIwAokKTqWAb2uSYIAscWaozh4Ug8w0WpgE6fJIt
	dEB7duxd4a84Hg3AzUmcqe/l7l5FreUF1UNyZWMsq4Uor0u4ZTbmXniRVHaKFVG+fhm/xm6X30L
	BBl3HnvfiEBz4Ig8Qs5dpQVdo/22jfit7P1Tmk7XlM
X-Google-Smtp-Source: AGHT+IE1J/3agy2pvlBUpx5CZrzP7qFSI3FtPdha4ZfRPlkfSyGlRzieK+BAcz2I5VxrRAtzHU31ktVhErvAuBdqNfo=
X-Received: by 2002:a17:90b:288f:b0:310:8d4a:4a97 with SMTP id
 98e67ed59e1d1-3159f518ab7mr3470283a91.15.1750425785075; Fri, 20 Jun 2025
 06:23:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com> <20250610160152.1113930-7-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250610160152.1113930-7-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 20 Jun 2025 16:25:04 +0300
X-Gm-Features: AX0GCFu22qEJwTwiXYLJyDUpuSZfvl_dtoxWhsBOKOtPed2Sd_Y2mWRPu5m8p4M
Message-ID: <CAEnQRZAhsCc==X1At+s5pb1bocnVmb2sFKmzNo+gqkiWAqFHag@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 7:04=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The DSP needs to access peripherals on AIPSTZ5 (to communicate with
> the AP using AUDIOMIX MU, for instance). To do so, the security-related
> registers of the bridge have to be configured before the DSP is started.
> Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
> property to the 'dsp' node.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
