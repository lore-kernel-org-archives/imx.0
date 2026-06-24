Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E1B3B6349
	for <imx@lists.linux.dev>; Wed, 24 Jun 2026 14:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312613; cv=none; b=V2P1iUGVYl2uF/WjNbl/PmkJ46LLzpIV4f6mf8SAh3mZXl4pb2BK9en3ZlaB6EgqR7Zc5MzIWhrB7YjHM6RbkJO+hJ+r5YZKoD/uFyw9kVKn5M6cIBKVctFT3ZLce7INvQ35wKEJ7pnOLtsdEL9xSzaxmHVm7zjdfv2poN1j8yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312613; c=relaxed/simple;
	bh=0dU/sVngucZU5hKfaJ6D9/TxFZwQBsvHetuYEoSWkVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZX/awN/1rZXnLaboHCksPLGa50csR9XWeBqe5x2OJipMXwrZCt5RugsqXvjq7JKXa1l5+bSG2NHFr29YvIj+X+kRoUb0qUDQXstJchz/AJsVizCeBMC6i948f/dZrRAPezZz5m38ECtdJqzof8sjOnQPCgVk1yGO360XokzWsHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILMoxI+W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILMoxI+W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BDE1F000E9;
	Wed, 24 Jun 2026 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782312611;
	bh=1cs9hgAaFSpr7bG+/RGCx2orw6e6bKxKaB9aS5Ozh+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ILMoxI+W2igdGIscRvoeHaf9N3N0YapWOpuv36faD4TUctL+dZufhGnavAtiof00G
	 GJDBBDGOpMdky9hbah9zeCeu2yZBayLq7NddhSTdIctDD9BGBXomXnXJO5YOh8hbj6
	 3trkJ6hecRXdETDI/BEjLPe4ldUa1wQOVC3rW9Qj8Q3R95f4vTtSZfWxDcvFBQ6FjL
	 XcL7C/EqT0EkyPUfcmutf5+zrPLv3S9zMNeXGRPOTjOnMOg9/mYpfbxoUDEVrIkYFJ
	 DBRhrfOsPA0ZitWopa/a6YZRdmTSq6Ce8FbrlI1QY60y2lcoBZ6k6q1EP2rg0FSc65
	 PH29zGbfsdTiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mailbox: imx: return TXDB_V2 timeout errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260624143707.49344-1-pengpeng@iscas.ac.cn>
References: <20260624143707.49344-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 14:50:10 +0000
Message-Id: <20260624145011.72BDE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Redundant Code / Incorrect Premise

Pre-existing issues:
- [High] Logic Error / Soft Lockup due to un-evaluated loop counter
--

commit abf054d4f4e6c348411d5d121feb6e209279efbb
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

mailbox: imx: return TXDB_V2 timeout errors

This commit adds an early return in imx_mu_generic_tx() for the TXDB_V2
case to handle timeout errors. The commit message states that without this,
the function falls through to a common success return even when all timeout
attempts fail.

> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> index 40bad2b3e4d19..1a44962b22afa 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -280,6 +280,8 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
>  						     cp->type, ++count);

[Severity: High]
This is a pre-existing issue, but does this loop counter increment cause an
infinite loop when the warning is rate-limited?

Because dev_warn_ratelimited() is a macro, if logging is suppressed by the
rate limit, its arguments are not evaluated. This means ++count is never
executed during suppression, which prevents the while (ret && (count < 10))
condition from ever being met and potentially causes a soft lockup.

>  			}
>  		}
> +		if (ret)
> +			return ret;

[Severity: Medium]
Is this early return actually necessary?

Looking at the end of imx_mu_generic_tx(), after the switch statement break=
s,
it executes:

	}

	return ret;
}

Since ret is already set to -ETIMEDOUT when readl_poll_timeout() fails, the
original code correctly returns the timeout error to the caller. Is the
commit message's premise about falling through to a "common success return"
incorrect?

>  		break;
>  	default:
>  		dev_warn_ratelimited(priv->dev, "Send data on wrong channel type: %d\n=
", cp->type);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624143707.4934=
4-1-pengpeng@iscas.ac.cn?part=3D1
