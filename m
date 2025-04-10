Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EFF2857EA;
	Thu, 10 Apr 2025 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294296; cv=none; b=OYd7inSeen1beryw9n0w/DHOppU888sLu1JnBYiuEHimm5fonKmH9J6ShyoJ20IyfpQFPPtQ3QMuhPK9r0IkYtTNys3XIIcpifoDQbkMVdkLLLT4EFxvkzIlA4dKo1EMy2PEI2MQmM8Piv6cc8iR3O5GQUtsBdVRY4ruFClABAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294296; c=relaxed/simple;
	bh=rco72FMDY4JgO03QNoKdCEdvvo+YwCaCCrx/8pDGOPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0i9obL9ebakpL9RWEgZUbMf69FkcgMJRYH8mCDoYKnqlUDzjK194LEpVhrTG0BqZ1GsXn/kTjoaH/U+QhdncwUQWZFithu8UM9PHEWEGVDkNK929IRuMw73tnT8LrJakDnOxb+ZL5xIUI15jz5Bbh5JoePL9jTDWLBqw15kY+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQ7IoFkt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQ7IoFkt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6165C4CEE8;
	Thu, 10 Apr 2025 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744294295;
	bh=rco72FMDY4JgO03QNoKdCEdvvo+YwCaCCrx/8pDGOPE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eQ7IoFkt+osTTj0Vi2+kpNtwDFjpZvXxiewz37bA8FBL4ZFA+CuGaUhIkcbbXR0k6
	 29Fy2FHt0RumRcvkuDYPQqmLh45tYMCsTeWcx/7yRedEvadWGSNT3qNQCaOEPWaIhi
	 sQ4M/3koFKQMQtD/p3dgWNUi+TktHMSbsFTetAE7iQAOPr1kFNMDHElpUIfORI75ih
	 Y1mz/jaogtjNAchtXKtaHV3jAfPhlwYK8l+Ev9ql2/fTarC9pdP6vCO+1LVsL1mN4F
	 wm3PLW30ItliFoXF10R7DtPFDDPMghDP0rRQVzEYt78nRT0N33cKXJqOrMXX+rXwSW
	 sXJVlxGKmrCOQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f0c8448f99so1765207a12.1;
        Thu, 10 Apr 2025 07:11:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7nT8ptFCJoSUgz7KKLOqJYB1dlnfNHxp6i9hiYqKfce0gfu4VbyPsoDV/9emXt5geIQk=@lists.linux.dev, AJvYcCUyHaTWobK2R6SS/LugjSLANE7dTuFoA8QwidF/pES17YkDe5nXnMbQOKprThL3IoCkPdtQrwTFPJRt7z4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUk/QIrPU8u9zNkdUCVnvBvyByWyF3AWOt6wlwkh9lkMYu0hvR
	D3tpqOCby95xEWSK4jAf2MPjTbNxHAjdSjYdxE1tIKD7L3s0kRETi0sTf/MhBIffGqgGwTsndZ4
	IK7zyBccYn6Np9FuU9lmsQw09Bw==
X-Google-Smtp-Source: AGHT+IGlh97um6SMQiGxBgsgdbsviDx65SZRgGYwOH79oWcJKJOpcvjinlVEV2oCvrCbvL9uHlFPqdqxcM1fMXmRyBY=
X-Received: by 2002:a05:6402:42c3:b0:5e4:d2c9:455c with SMTP id
 4fb4d7f45d1cf-5f3292682cfmr2701509a12.10.1744294294406; Thu, 10 Apr 2025
 07:11:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-14-076be7171a85@kernel.org> <174377856145.1313232.11316769002552655294.robh@kernel.org>
In-Reply-To: <174377856145.1313232.11316769002552655294.robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 10 Apr 2025 09:11:22 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKiduJBRBuRS364_bSjEfC_cvgyicZX1BwvNyb1+GVc3w@mail.gmail.com>
X-Gm-Features: ATxdqUEvfSUaWUzPsxy3ohcumibpamjDRmILBf-6gs6fjUtKKg1MwCu-Qt45NOQ
Message-ID: <CAL_JsqKiduJBRBuRS364_bSjEfC_cvgyicZX1BwvNyb1+GVc3w@mail.gmail.com>
Subject: Re: [PATCH 14/19] dt-bindings: arm/cpus: Add schemas for
 "enable-method" dependencies
To: "Rob Herring (Arm)" <robh@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	linux-rockchip@lists.infradead.org, 
	Daniel Machon <daniel.machon@microchip.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, UNGLinuxDriver@microchip.com, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-sunxi@lists.linux.dev, 
	Liviu Dudau <liviu.dudau@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-renesas-soc@vger.kernel.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Viresh Kumar <vireshk@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, zhouyanjie@wanyeetech.com, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Heiko Stuebner <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-pm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	Samuel Holland <samuel@sholland.org>, Sudeep Holla <sudeep.holla@arm.com>, Nishanth Menon <nm@ti.com>, 
	devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	linux-amlogic@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 9:56=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Thu, 03 Apr 2025 21:59:35 -0500, Rob Herring (Arm) wrote:
> > Replace the prose for properties dependent on specific "enable-method"
> > values with schemas defining the same requirements.
> >
> > Both "qcom,acc" and "qcom,saw" properties appear to be required for any
> > of the Qualcomm enable-method values, so the schema is a bit simpler
> > than what the text said. The references to arm/msm/qcom,saw2.txt and
> > arm/msm/qcom,kpss-acc.txt are out of date, so just drop them.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/arm/cpus.yaml | 82 +++++++++++++++--=
--------
> >  1 file changed, 49 insertions(+), 33 deletions(-)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/s=
oc/qcom/qcom,saw2.example.dtb: cpu@0: 'qcom,acc' is a required property
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#

Any Qcom folks want to tell me whether both qcom,acc and qcom,saw are
required or not? All the actual users have both.

Rob
