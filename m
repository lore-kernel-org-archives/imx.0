Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D125B3B3891
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 07:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215881; cv=pass; b=Uh6LHHtAD+DV6gitCAhGqK+kENvFWz9bZSFICPeuUnmRwOyUBqLHboaIjH3VjbSI9gst+pdDpghPJc6SmosLsv6ZxxaZ2Gf2EHuPdgY87ZOCRi5s9XQjPZCZlryF7nEFELPBtvg3hg7fLvt19RlscgblId+WsSn/rHrCVZGlEmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215881; c=relaxed/simple;
	bh=KOemrfvGiBCiGgnJ8CfsltCzoFMPUgEW3U050UEVSRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IggwD18BjAt+6o6bDETBrgbreTgYObzUF/BpnEmYuRgSDMQQYX2mOaZEcdrTg3RFC+vilJGwOb+XztrH028OtruN7FXn+E7ftlPbCVf9iXW1oeRRkft2MRueSCctIyFgGi8qrNvCFVkZIBsnn6oDL26b5WVD7oK65VYEOvWq7mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E98HGixf; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E98HGixf"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1273349c56bso17238580c88.0
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 00:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773215877; cv=none;
        d=google.com; s=arc-20240605;
        b=BT/h8GNe0fHstNahYl4kKloLz8g8EGwO/+Emj4oKPRfrLA6pYdTmnQiMWo8dg0aMwp
         2ZdvoriTgZ3xc3Qw6OEhNMUVcoPointJ9pip5mcvyWqvixZ3k99MfkPX0nyxec5N4aSY
         lEoolyIAp5RIzxgnCAPQOuiY26zPpDCZSQXaWq/7OKYLz7rxhOdMRYrA+RNBV/TvzglI
         mOzfGYvcw8YzB4SntIBNK2TTUnmGIzUHsl7D0pqPIF7Kd30yL6mA5mBzfvzxWA8HmKEN
         Uh2Wmx6+9BJL+gSPb2w+SbaLA6n4r8URojt2mcXK/7c3CYysC2oX2aTmUQ+Ori+SRfhl
         KqKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KOemrfvGiBCiGgnJ8CfsltCzoFMPUgEW3U050UEVSRY=;
        fh=pgjG4PAyPGon0TapJoNfoNVsnt6rz5ydoFWUERxDTYk=;
        b=DV02OPV5rxQ6sYb26amqTNgTqjDoSuXl0fiRPta8NjTeyfB2ovHo5FR8NZBISexGLF
         t2lariHmJVUtkL97Wdg1p1Nc1q4ODY5qjQGPE/PyK0nSYnRkfbFwsgiVK0YSaGdobfkt
         scOJUyduVdiAIo342LDk2xcOU3TnvmYCrxAyRvJCFDabCyDd/C2edKrN90cjW7sUD8t5
         8GSQzb9neNnt+WwTblqGTGi2QJpoAaOj1cQZklMwRs5ys87Fo71gFmowomp/6g9stUuW
         P09mK/7R6/oGS7gBnjVtG58KFUxZMsWzOE/jj/NSVKMFhlyi4UxzOtQIqkl1bF2voj/+
         +QOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773215877; x=1773820677; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOemrfvGiBCiGgnJ8CfsltCzoFMPUgEW3U050UEVSRY=;
        b=E98HGixfQ2OlOtJ6IpL6uzpwxa9ZkMUobPJDDcabkfQ0ZWuvW5AFn7dqhk4zTQVQ79
         u0M3xs4ggEDezJ7S25yBb7GsCbucB51jstrXncXNfb3RWAuxwHpbXA/NK3Z/Nsz6+/V9
         GxrU6jQoQLx2AsGFz/htHuSiAO+ld5IULZeN99X8254wXQWqfmUvhya14r6DHzRb863U
         wL2nR070s54KliXLWKmUtPQlLvt+0SNLU3+Wu301q/aCUMUEprIWp3/eseY76ulObnDi
         SmVlcqx0M5Ul2q03RZfX3bGyQ98CKj3Cmvk6meCd/SJ20wWmttGIXyJX4TkTHhSBWovN
         M+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215877; x=1773820677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KOemrfvGiBCiGgnJ8CfsltCzoFMPUgEW3U050UEVSRY=;
        b=oBAbsL7FSy/VszbXOsr38dHZvWLNK5m18jSP8LPJHRf15i4318OduBvF1hnXJTvqeF
         bO4uAfQkb476YL0H+eyvpQU9GB+qA45O8Kg76A6UQtJj7XsO8A3VLbrGkGmXSHifLHDL
         U8NT42tOcYLA1RIZ5/QNnyVMoFeTUkhIwnL9YLdjnbBfHmG6Em98qrcUYdp0h+Z4/Em3
         DJhU4Ibsmk8UowjoF0vZ7YW+JvXI/052VPMqMg4ABstQMi5FsWk659Cv/nm8W0FCCfs/
         lo8bx7wVvxANyPvoGN+sE/YOmdmX/A71woZwWzD1JYIShqDf/WOwnMwcoueOf6iOhkhz
         JNRA==
X-Forwarded-Encrypted: i=1; AJvYcCUYRh5j+EI6wVWKnHQNYi2ORcpxw/NFjWlI6R4hGNh1AIDl2I6XmZ/gk7zS5mFkOTANhhs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yws5maO8flKZMUoZopDpKLKlEZYU0HsVskjSYgKtUY1BP9Tnhih
	1mixXKr89BfQfXKlG7BZGsQ2lPt63OCu5uuYRBSgxll05DhVVFlRq60o+boZ5r1OblEbXEu3YPN
	tSaR08jsISAl7xFGIcaHllkdAk+rna9Y=
X-Gm-Gg: ATEYQzzjPONZb7hI0+qU7TK6ciWG58eT4w5cUX20w5WEDZc78zmTEVWQaGKcbEqeQLD
	o5xhqlexi2tNeXU+BMk3Tj3izly39FE0UqZ0FhbyAX19AeFc9vWzkyNFVPpfx2mgILfH1BixlsG
	/ZKtTITX64rOSUhtyeLYy3K/leo41Ov5aiSUfEbItDkreeHFUS2KOzX+kCEtoRtgGVRNWvwUSqZ
	896opF/Nm8wa5rhvIo4pmacNDRiXEIRMRR3t4SVV0qc5IIR7/RBKmtDnhT7wULdp7qZeYRPsbra
	GoLj26ll28+lDTgQcO6gcDFg3upsDL2yV3jVUFLg0x/6ly7XojM414DRF6t/J33ssjfvGX3NgFe
	gQRa3o0nn40f99f1Wre4PPQ==
X-Received: by 2002:a05:7022:6a5:b0:11b:65e:f35 with SMTP id
 a92af1059eb24-128e779f429mr633648c88.7.1773215876789; Wed, 11 Mar 2026
 00:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309181524.39423-1-egbostina@gmail.com>
In-Reply-To: <20260309181524.39423-1-egbostina@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 11 Mar 2026 10:00:47 +0200
X-Gm-Features: AaiRm50JciUmzn7VGe0FizTaDHsgHdp0SKlfOQwmdsfLT8aVkL95VbuXbIkGlKU
Message-ID: <CAEnQRZDZ9Z9ZJhETyhNRK3fcxtdCKxTXuiToagWRFZOhtBWpOQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-dhcom-pdk3: Use symbolic macro for IOMUXC_SAI2_TXC__GPIO4_IO25
To: Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 8:20=E2=80=AFPM Eduard Bostina <egbostina@gmail.com>=
 wrote:
>
> Currently, in order to configure IOMUXC_SAI2_TXC__GPIO4_IO25 a magic
> raw value is written in this register. This makes the code not obvious
> to read and modify.
>
> Use the MX8MP_SION symbolic macro instead of the magic value to improve
> code readability.
>
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
