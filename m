Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA5B45C710;
	Fri, 14 Aug 2026 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786727188; cv=none; b=f6P9L0AUFRt+KmP99LJpF5r6zeOELrtVcgYDLHRBt4GZpEoai0bcZkp1k4zpETC1U7KkP7OcTcyq0RGZuqVu3Y/N3bgab7Lk5xKn8Gua+FClL9CDKjNpPpAjLPcy+leXdKKzISmqQhw/PnkvuEKjzIh4na5+J6cUPQPFADLAa4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786727188; c=relaxed/simple;
	bh=zJ0SoiC1a+gm5ou2jgMz4HmAzZ2zw4DkuNiKEMLhT68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjpM1coc11Qp8tAUNk6n/EFkzIHGpCsP2bE+1m3iiPJDUo+gbJLxYddJsRT5CBSZchMdZ3Spn1cI1kq9FthrFIb3SCF5ECI5ocDv1hCqCnkZDaCoWm6kQAFQ2xzvn59/ZqaD5Cn/1eK4OkUJE0oDMmBxfis5ajqETH1TQA/2l7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTjZ4+Xm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTjZ4+Xm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD45C1F000E9;
	Fri, 14 Aug 2026 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786727186;
	bh=o3EKBMGuiyTQLYijetS8Oe22kLuLWv9OK8hBvGDMdqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YTjZ4+XmpeyK7hFrnDnbsA2lqlTKJCogz1ku4/vfx4ifwEtB4J0aBUi0vF5vHHCqo
	 NsX4giAAzp+cQ5fymea9Ob7O+GrAiWow4rcjD8GjxfNcJmIWm9KkOeZ86Fb95/XMYW
	 nSl1c6hr0IzzJ5gCsDmYBUAdEq5LM+ilJCv6MoeaMy61qN8ssSnC2N812l2/kLENgg
	 bJlkuFnnKnexDK9D4g8wyGqk6NkgMFwYEqenWO4uTefxr0zqF3qohlliB6t7EtHAgS
	 s2Lv8FBU/DGvlGlLUm782gtRlyNvaaaI59/WSWh2ZwCgsPmoNI/I6T8j2ADHUUG2UV
	 fxXEMz54kk4ew==
Date: Fri, 14 Aug 2026 10:06:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org,
	konradybcio@kernel.org, robin.clark@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 0/3] soc: qcom: ubwc: Fix link error
Message-ID: <20260814170621.GA532729@ax162>
References: <20260812151934.709198-1-daniel.baluta@nxp.com>
 <20260813232350.GA312295@ax162>
 <0b9128de-e2d9-4271-97b8-9fa0c7f6fa3c@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b9128de-e2d9-4271-97b8-9fa0c7f6fa3c@oss.nxp.com>

On Fri, Aug 14, 2026 at 09:42:52AM +0300, Daniel Baluta wrote:
> On 8/14/26 02:23, Nathan Chancellor wrote:
> >   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:7:
> >   include/linux/soc/qcom/ubwc.h: In function 'qcom_ubwc_config_get_data':
> >   include/linux/soc/qcom/ubwc.h:45:16: error: implicit declaration of function 'ERR_PTR' [-Wimplicit-function-declaration]
> >      45 |         return ERR_PTR(-EOPNOTSUPP);
> >         |                ^~~~~~~
> >   include/linux/soc/qcom/ubwc.h:45:25: error: 'EOPNOTSUPP' undeclared (first use in this function)
> 
> Hi Nathan,
> 
> This issue is pre-existing and I've sent a separate fix for it:
> 
> https://lore.kernel.org/all/5fy7l6o5nfzclsmhsqys562xwoilbo4xv3af65kcqugtitgltd@3fw2w443pw2g/#r

Sure, it is a pre-existing issue but it is only exposed by making
CONFIG_QCOM_UBWC_CONFIG an optional selection for these drivers, so I
think that patch should be a part of this series. Otherwise, I don't see
how you could actually trigger such an error.

-- 
Cheers,
Nathan
