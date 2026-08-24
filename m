Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABA03F3294;
	Mon, 24 Aug 2026 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563072; cv=none; b=l6+Q9YYA0mzIDw3WdB5MiQZR0e8xJ3ZyiJe4JbO5pRr6PBL2OtQNu/f2qAd4aJiPEXJojfari91R3lBACLUT8MGDHPWifiNTU5ewTcEA/oPXXxOyF+hacV+smVTibEODJf/ynjStNQEBMqC1cawFVa+8zGJmIhA+QzzR6M8qKTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563072; c=relaxed/simple;
	bh=X3uVfVAOP+LcWxkMVO3m4unjHnHFFKap7CWMzlrasYg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l1zEeAT9GkQBTp2K8txTNUzvJDl5h2gnD1nyXf7m4mQ+qxHeqTgn/uRhjze4KByOAxJjf60aOGhwyp9CjDE3UuZC07oPwVQA1U+c3l6j3UCLhQaRvi7oKus/YZuQh03cnl99Y9GmYsA9DHRAk7xdP2Tq+YY5YPS1BA7DZc9bID8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOYbaJ01; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOYbaJ01"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E5B1F000E9;
	Mon, 24 Aug 2026 09:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787563064;
	bh=/VEIN05Um+EbG+RY2Cch29kjNtaRc3uU49kYlCdpxM8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EOYbaJ01MT6DNLKmaUbz6Ml2Du9KTDuV3rECsC/KKKDzUi7MOQq95UrsG/6wS9l6O
	 CRm6r1RZlW+1slY2lzRd5tSFe5YddWKv66LoH4TVC1lOKc0hP6akyG5Gn0uKqTlJTB
	 zQvDbLW17WdotJYud+OzkaNeW6mSgqVH58J7nnTqb2oXAGLij9kfy3A+My0+n7TSg2
	 Sfadcy0PsCAeJCCVEa+lGT4UEbqCWPtlJHxKZrMYgstUc6LVlgtvSOYmCNgoKI8Z+n
	 yafEluuaatfLThoLV2pb1HmciN5PhG9dkhAlai10As5NQXfEjWXVEFvyOXXsDF2Iqx
	 oCJsgX1joWCLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v41 4/7] firmware: imx: device context dedicated to priv
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260824-imx-se-if-v41-4-29cf129e4d86@nxp.com>
References: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
 <20260824-imx-se-if-v41-4-29cf129e4d86@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 09:17:43 +0000
Message-Id: <20260824091743.D9E5B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing Use-After-Free of `priv->se_if_cmd_lock` due to incor=
rect devres action ordering.
--

--- Patch [4]: [PATCH v41 4/7] firmware: imx: device context dedicated to p=
riv ---
commit d02e4a5df59f7ab91519903b9c6543123c1e4afc
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: device context dedicated to priv
   =20
Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> @@ -437,6 +465,11 @@ static int se_if_probe(struct platform_device *pdev)
>  		load_fw->imem_mgmt =3D true;
>  	}
> =20
> +	ret =3D init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to create device contexts.\n");

[Severity: High]
This is a pre-existing issue, but does adding this new failure path make it
easier to trigger a use-after-free during devres unwind?

Looking at se_if_probe(), earlier in the function devm_mutex_init() is call=
ed
for priv->se_if_cmd_lock:

se_if_probe()
    ret =3D devm_mutex_init(dev, &priv->se_if_cmd_lock);
    ...
    ret =3D devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);

Because devres actions are executed in reverse order of addition, if this n=
ew
init_misc_device_context() fails, the unwind will first call
se_if_probe_cleanup(), which frees priv:

se_if_probe_cleanup()
    ...
    kfree(priv);

Then devres will run the mutex destroy action for priv->se_if_cmd_lock,
resulting in a use-after-free on the freed priv structure when
CONFIG_DEBUG_MUTEXES is enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-imx-se-if-=
v41-0-29cf129e4d86@nxp.com?part=3D4
