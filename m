Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86972FC881
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 07:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769757616; cv=pass; b=q1rBdKjPDmnDVrBnzrMIFrluy95FURn3fyqWcHa2MCZWOjS2Ge/4GizEaR3auIjFVvxu7fa/CvdOwVUcFljfR04uQ1DJV//aAZ8B4rlVKsaReQ7qfwYuE+OSHBnAYsbPQZa2LjFLCqe6aOp5iVlsjg/zAWNGbo224YBdig706GI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769757616; c=relaxed/simple;
	bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTu8GBGMORycflW3lnRbD914kPMwHvjPY9vTCMwPFMWSM4VqVjO++jlAPQbHA80PTLe++aADct3Zo4Nqog5e0fvBvJbqa57WhVGCC4cyHGbPWydgYlZc/IZRjlChKyILA0F0q7dYFR2ODIP5Y3iIayaFs7aB6PW4yh4l3hG1Djk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xg8keuBU; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xg8keuBU"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-11f36012fb2so2305852c88.1
        for <imx@lists.linux.dev>; Thu, 29 Jan 2026 23:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769757614; cv=none;
        d=google.com; s=arc-20240605;
        b=Pf0RvSKnlhrqXKnSJPWeRpf6lKwQgKrctjlxDNWL3u6MGDaQHaqHPCytLpwZzaUA5H
         Zyisvp4YIHNxG6hFHlq64a+juaxgXQqahjv71rZyBz5J3MzPsFyXy1x5BZCgFpZMK5qz
         72IepythY2Gf+tpuFHqyQIWd06TQrGgO7qXG1uWCfJScQG49vLJ/5ClDTOrSeDh5+8hU
         En0Jn5/KFwu1vefuQ4hwXfjmPYGvzKGDcjotQWtN9HwKF0EO9V6X/UYRle+eeoTE8In6
         vdyHENZD0o2TC+f0FxV5htGc5jl2+H5hFicZlJtFFkmaNWqYIcZalaXDPYNXvByFqibE
         r1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
        fh=WSvg3oIrn15Db4faOG5c1BNwb2bZ1H4PzTTyfHDaNGA=;
        b=bhQ0/Z4eJGyYvlKBTWxogdJibbKvsSlhL72pP7gdl9dWHbnpXc+saPsN34oNnoMnT6
         FRp6uUbq74TU7Gl+vk3rs2UvrRRsFrYJ3OMq2d9JYBmYGcbORn9CPHF7nYTEmB7QeQN7
         5DR0wDZEetqB+mVJE9PL2ICjEPovqyUVmfsMK5fdgsJMnwfVLiuhKD6R2Nx+WDHROMao
         9O337x0RsBywLMK/yfXSzkYfvViHq/E6YBwv8zm8z2CKjLbyN0NyXl253Q5cbGrcKHZD
         CZcaNwdlufuT5vuZ1wCmsVIMhFT9c3MGL3UzYPsaWN7rlyg2fnO70Ka/gyApePyUwhpc
         vO7Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769757614; x=1770362414; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
        b=Xg8keuBUU6loAi4cjNBISpq/4lhru4HLUDIaOIB5xBOWs41pN0hUgBWJ6olJ20tznS
         IcvlcyF+vtLRy8lBeXqRoS3LJ4kBumu6tP0nBrqKJ0sQOZmB2fRC2/EUprttFV0ZYgUF
         K620ckQQbDN9BHaMTaJOBnd0OgQnJQVm7F7Pa7gQdtqUIk05xlmKKi/vMnzmXNmnGH6Z
         6IvQVL355DqIMy54Dgomy6eS2r3EPY7l0Omt40JQrnUnAPGM7mwY3fGh3VMX1wSHzJ3b
         lbVBdEScN/afAAK9nW7M/tlFJu9MvHnPb7zyXk1Yvh5EFU3ZzNnvrS2OtREBFvsXV4TI
         ZhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769757614; x=1770362414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
        b=B+UmWjFFdZ9CU5TXh8lEtDz4XoichC3rZHkn9xF/W7UJl9J6aks2704y9O7P/jP7fh
         YpUhYrDghBtmIQYx9hgvAyg2BTlWk+hRY3FRhlPCsZIUPB0y9+rP7TCcjgTml2YOoDXt
         vR0fXzIguP0Jf/GzNvk91IYclVRbVJrcKvRh5RlieX7BMZH6E5XcfLFWuctPz9d0IbY7
         BxQaUSiLPjT0Hinck0rgCKnaXcP25lHacfhOWRlVKBIYdjmpoi6kllrJPMCMAmoDgHdP
         i0xmc/kXajT8QWJazZ4srqsCN/Wd/5RzmyKSaYV7R9pqxw/hZOjsGpSy0eVORojCYvzT
         FxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVohEmMCYDCBuJ4cRLLqa+pIlEQfjuhLP0LGgXTO6I23DeCYBdrj2oKzn8kFb1gi0qOuY8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOS08Jl4XioQKi536myq9JMgtmC/TfTdhhLDOfjiqXvJkFFfL3
	Z/6vjejV2nyUx4zE1hvzaoMzo5jw50i6DdZZsUuCgi1rtnpFnmYJupAZgaId8PZFxaSlTjl88gl
	g45WSOxpnET/mka8EgRw5TcGNdZ8jwQk=
X-Gm-Gg: AZuq6aI+DKxgE/4ayy6AR77dLpVEneH7kfwqAfZS3LspxYhARa+sthhBCQwNL0vWpuH
	zRGmX+wlkl1nRRfZN4F64f/Znjo4XA7EzuqjM9m7EKhp0bJDW0vPVbP32D+yHIWqd2i3k9HI5MB
	GRj6Ohv914BQKdgPFC9zwBdH+OTim9QG0sfJycqgvDz4+a/3zOhIP6PjpcpjkqD9Joh1p0zk2pg
	PRFRHcgNpwKASHwT7cEfhIRmu+Ze/JjQ+FDNtU7Owz2cPOS1cHkYuWdh809rWYHEqi6ceSTib+i
	RguvvbP5rFMBAVGhI7x16xIgF4FT582MhgCVYNr7ePu1tj0n6AR2t0MeP6JJ/P5udAAhcsyWR3x
	RR29t/6kb/WsXZw==
X-Received: by 2002:a05:7022:207:b0:123:35a4:e8be with SMTP id
 a92af1059eb24-125c0f8d01fmr955848c88.13.1769757613717; Thu, 29 Jan 2026
 23:20:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com> <20260130054330.3462544-2-shengjiu.wang@nxp.com>
In-Reply-To: <20260130054330.3462544-2-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 30 Jan 2026 09:20:01 +0200
X-Gm-Features: AZwV_QhrTfQ-UYZ4PfDVoCm6fliDdKe2PvVXhTLbJKtRrXqH5MmZHe0lNlu_Efo
Message-ID: <CAEnQRZC5umZYoxemGO_yc5xT328uQxUG8Sg8yZvgDowhLP6UPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,imx-asrc: Add support for
 i.MX952 platform
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 7:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform,
> below are the differences that make this ASRC not fallback compatible
> with other platforms.
>
> 1) There is a power domain on i.MX952 for the wakeupmix system where
> ASRC is in. But it is enabled by default, ASRC device don't need
> to enable it, so it is optional for i.MX952.
> 2) The clock sources of ASRC are different on i.MX952.
> 3) There is a limitation on i.MX952 that DMA request is not cleared at th=
e
> end of conversion with dma slave mode. Which causes sample is dropped fro=
m
> the input fifo on the second time if DMA is triggered before the client
> device and DMA may copy wrong data from output fifo as the output fifo is
> not ready in the beginning. So there is specially handling in the driver.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
