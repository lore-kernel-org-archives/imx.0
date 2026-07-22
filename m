Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42944334D4
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 21:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757211; cv=none; b=q76o+2o8G5gUTUwVGWGFAdFiybmewXprbI2XCmC6HDwji1IBDdcpHXW9A6YHVWNMUQtEMs7PV6Wfa6LKWPPtfnL4cXRKjg7i2FB5g6FyxsSQ0HovU5N4JLL6NAJibU2bZitgpsbzYbf4zhQY1XsGSFjloOETHH46Kh7LkoPCxpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757211; c=relaxed/simple;
	bh=xfewLHW10EN5u2eyfd56Kh/e8+peWlgKCd1UGQyH6ZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/yBBmKeCHYwe2+jLGNUDop8vPc5qm2lQNdajZz4eqypIZQ5SNTASbuXzs9spbzS+f0hMc0gh8iDYEUHQBgmpLHsSaRB7wjkYLdeSThfI+8Zo8yl2LfRmiJYy4NJYfmviANuAcqppFNMOXyi+FPBCeuICZ+0LN03QPNtulr3etU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=cCowEiIT; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="cCowEiIT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1784757198; x=1785016398;
	bh=xfewLHW10EN5u2eyfd56Kh/e8+peWlgKCd1UGQyH6ZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cCowEiITeyftg2OJZKzC1i40C1u7Uj8+Od8YBBJND4eA+4fs16cjPYYR1d0ppDf7E
	 OKYf+Gzl8aG2xKhIhVDoQ1i0ijFBUJKzBp5/cEYFXFS2BHeDR3E1a+YasF6cIzh9MG
	 kmRNOoVxqKvmUUSWE1L38A9UwehYMvUySZVM+g6aGAovUruOSHIe8bP2g06NEVtGWU
	 4bvHnOQGrve+etZiDj7avo2hRrgSc+eMZpAYddLUnKh815VJ4EuzB+uIPoGt8aAvth
	 R1I6V0DJGO3kGUjEQxveQIqb5koYZD8Iv+5TWwjjGACnOiLPVE2m0NNqoSkkU9cmlQ
	 TdpsBAZY6E8OQ==
Date: Wed, 22 Jul 2026 21:53:10 +0000
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V output supply
Message-ID: <a971f373-445f-4add-8374-706d7f99c845@nxsw.ie>
In-Reply-To: <20260723-rubikpi-next-20260615-v2-1-47c5add80114@thundersoft.com>
References: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com> <20260723-rubikpi-next-20260615-v2-1-47c5add80114@thundersoft.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: f9332d42e8bee0446c36c427c9faa429a0848e0b
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 22/07/2026 17:12, Hongyang Zhao wrote:
> +=09=09enable-active-high;
> +
> +=09=09pinctrl-0 =3D <&vcc3v3_output_en>;
> +=09=09pinctrl-names =3D "default";
> +
> +=09=09regulator-always-on;
> +=09=09regulator-boot-on;
> +=09};

Seems like a reasonable thing to do for a mezzanine board but, I did a=20
double-take when I saw always-on and boot-on.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

