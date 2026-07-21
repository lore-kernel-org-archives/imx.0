Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64443446C7;
	Tue, 21 Jul 2026 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784631839; cv=none; b=Xv6UCHXiKZKMqQBpksyy2kC+elapIX2KW0B2aBIB2PTCeKkYQAdIooyiOL5g58f2vc7Y2RqDSPRqWgjB6C7Zfkzg6XKa6MlgTeYlDt+zy9bhurNKk1WM8Kms5udn8o3HEqV6f25/Ee5FLD+ajas5eVV9HLf85ywmaFJh6hlRZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784631839; c=relaxed/simple;
	bh=C1rlkpUTrT8vdptyu+2BfFrmkLFVcsCOXELYYhBuc7o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T61bBHzUf5g9UtjhdhMPMWS9eTpl03ZQxKk+XZnAEvt+N6Zd5zWYzgANeudQNXNRCDePB2m2dpFNK0pktQXqdFCeND4iaCI/cJ5vpyvuAY56LoLJ/bcL83vUmkXGP1lfRQmSaZUcetSad411TXDYktFkGfai6aF9zQeYkxNLdPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsueS3/T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsueS3/T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168A71F000E9;
	Tue, 21 Jul 2026 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784631838;
	bh=CSjdpYNSmsbl8k8uDlJ10euMOBf5L5uZNJn+8JFl3k4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PsueS3/TNsMpqTu480rNm6YkIc7R0T8zU4ycpISmaqSHsdlCm02IEFaoZMSNsT+9F
	 qxpU86xWUFj7aptTqeMGpWSUB0ztxjBUgTznbGS0cd81SScQ0HZH3w3WNk0lmXlI7Y
	 bSIIOIFsJevKQxw0qavZ9kkTMVz5y9mcbOArimLggRcsuSGKoCipEkhfV8QPfajP1+
	 PuF50FZ/KkH9ChnF/QmWsl9XrtrFDel9EkeQTYXnCa/KOOCKsr3I8aEZTeHDyZ4kkr
	 H7Qde5MRWYRjTbSPtk0XpZw2V3cQeZk8v9iLxNjoa5c2yfrdOwqpeYJh6/2bwk33z4
	 52oITyDV0onDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] of: kobj: export of_node_ktype for use by
 modules
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260721105448.2109894-2-xu.yang_2@oss.nxp.com>
References: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
 <20260721105448.2109894-2-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 11:03:57 +0000
Message-Id: <20260721110358.168A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch misdiagnoses the root cause of the linkage error and i=
ntroduces a new modpost namespace error, while leaving non-KUnit modules vu=
lnerable.
--

--- Patch [1]: [PATCH v6 1/2] of: kobj: export of_node_ktype for use by mod=
ules ---
commit b369d1afd3eb881423af86a559a0aec84ce01a01
Author: Xu Yang <xu.yang_2@nxp.com>

of: kobj: export of_node_ktype for use by modules

This commit attempts to fix a modpost build error where of_node_ktype is
undefined in the KUnit property-entry test by exporting the symbol via
EXPORT_SYMBOL_IF_KUNIT.

Link: https://lore.kernel.org/oe-kbuild-all/202607181651.RnUuV8n6-lkp@intel=
.com/

> diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
> index 1bb61a2c33994..081b8fa38603f 100644
> --- a/drivers/of/kobj.c
> +++ b/drivers/of/kobj.c

[ ... ]

> @@ -27,6 +28,7 @@ static void of_node_release(struct kobject *kobj)
>  const struct kobj_type of_node_ktype =3D {
>  	.release =3D of_node_release,
>  };
> +EXPORT_SYMBOL_IF_KUNIT(of_node_ktype);

[Severity: Medium]
Does this export actually resolve the build failure, or does it replace the
undefined symbol error with a modpost namespace error?

Since the property-entry test module likely lacks a corresponding
MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING"), the build might still fail
with an error indicating that the module uses a symbol from the
EXPORTED_FOR_KUNIT_TESTING namespace but does not import it.

Additionally, is the root cause actually the static inline of_node_init()
function in include/linux/of.h?

include/linux/of.h:of_node_init() {
#if defined(CONFIG_OF_KOBJ)
    kobject_init(&node->kobj, &of_node_ktype);
#endif
    fwnode_init(&node->fwnode, &of_fwnode_ops);
}

If non-KUnit modules include include/linux/of.h and are built with compiler
flags that emit out-of-line copies of unused static inline functions (such
as under KASAN or with keep-inline-functions), won't they still encounter
the undefined symbol error since of_node_ktype is only exported for KUnit?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721105448.2109=
894-1-xu.yang_2@oss.nxp.com?part=3D1
