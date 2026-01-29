Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D0A3148B7
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702380; cv=pass; b=PT6NZFNiUPqdJ2cSH9jBT37hpKfdN9dIJX9uZ39AbAc9MyqXfDZ+DMkyD27AbEkKMx4EQTgvJ8qDFvTQL7o6ItIQHQvwD9L8d9H0HqL7mqPF57ETElm/x/S+JlaMtmGkKDTicRPiQT6/pXqDuFZwGWKzDnG9jK51RELFPY2luaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702380; c=relaxed/simple;
	bh=jP6B/+HWGupxxJrmj9WayxckdF/Nn9MjSYPmAAE2/5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ark6y4vLRdjh57kY1jThn5a4n4WrRcdvGt177Uv1OgsdQ7Vja4YmsfVnqj5JTRrHmxQiXSTBJt825Qd6cAorj2oAi6Jnd4DNz8bg50DM6I+RVm0pi8XEesxPgSVGWzLPMG6aEM38axvAdY7oIsRXwKD4QnL2iFOyT3Qyqe0z6e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCHOOpvs; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCHOOpvs"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1233bc1117fso1503232c88.0
        for <imx@lists.linux.dev>; Thu, 29 Jan 2026 07:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769702377; cv=none;
        d=google.com; s=arc-20240605;
        b=O6OMn7/vaqHttgXCG6OaDH0Y5r0PN8wV+N2Sc1ZA4AoHHQNworTZi989cWspC6iiLk
         SCe7WaxZHh3VUKKS7jDZYjc/mYEgnpeeXa8jetpeXjAOKz8mgbAqmYOEg8zo4MXZv2Jo
         kxNNK66EO/SrxjxHFG6S43o+U3dvXDGmbyAMy1a0c0fBlA7C3xP6U+2VA6Ny0K1KRgqO
         Tk51336xJZW5M6xyGanMNuseOjiPdVTwJsWtNYm8nlfjGFEIgZk9RwJLKK9l6Dq7gcDv
         oLzGpB0e9ithxNqbipoyDVpFT5Uvxqyg4LyQnazYjTd6HEq0KacOgLSpYAKriwOZSkys
         f44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6mJvDD1VpYWneH4exWtlRRFpCw/yxXuXg63uajYfPqQ=;
        fh=U5Djn6qQE+oE07vb3jQn9cihcBsOj0yxV2mjTQcp/Ig=;
        b=NczJGbR5C0M0X1eFb53rPnF4Bx1j76P5QbuzpzvqHvjicP3TTLA34plwBc/j9pbgZN
         TQCB95WH2bSOrxJbEDVYmwXLatPClFegl3CNm6H8OTjMxKCd6u20HuemkeYicJatSJ2m
         c0pco6LaHrGNZxCYx9SqQaOkkEeIkx5mXQRH/Ec9HQRpUH7urZq0exU0GM60enPjIGp5
         wOF3zr4y+cqUD7MJPd2q0IQSI3WvThP/Pb18GpPrmPVWZHw9DF1V4DR0coGomtd3LQqe
         hTbQfUI0pCAILuZxy+LUW8V6zX/YYqRrlNexcWe8+s3c7OhDwR0EgYqChA/LSUnm4I11
         9syA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702377; x=1770307177; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mJvDD1VpYWneH4exWtlRRFpCw/yxXuXg63uajYfPqQ=;
        b=FCHOOpvsJD0xTrD+6dFF1JaJXfxvZEgIvLoEUxnbUXeW8SIyPxQpSC0Q3bViQxRkMj
         FFTOmSKkREptchuxJaM7TjGCIdBVqQCBLqRL4zdaWYQqqTLMGZYscWa/PWyVYFS+t90U
         Lxe1xCeVbZXjw1Qt3pkAuZsnca2aCCsAeDLjMcu/wM1M3O5i/QxyI9ivVLqvZEGVZ2v0
         R5KnVUZhtgy4TKmAtCW/uXfL5YSHe135pqXt83oA4/M1w/sxbpQRI98AD7V7f8xndthg
         q3dNT/FxI3Bg5rnw/GJIC7aQsdAQ4jz1rWEcuQa7el8nfNz6YeDzISFthF8R7Ai3dZV9
         nXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702377; x=1770307177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6mJvDD1VpYWneH4exWtlRRFpCw/yxXuXg63uajYfPqQ=;
        b=HyGJ0a5LhZuZcO73uIlh/rkeURdYusp4HPTFfhFwV/N93P+lNRLrQsdWeV6H4i2/3W
         aotBICWYiae7v6vsLxDCq6yGnEy8e0JdhrTP3D6qRHXcmVUURtZD7gvg8urEXRfO1WK0
         mWk2L1G9UzjXCGhiKpfZ1ijRaFVr2aU2ADu3nJam4vm1ew5wKWq2YsdD262GWDV6qluO
         habl644eOfOW5YlFanoVGUwTszqeznl8O9aZHqj6UskEAvtsgbYdiudZCBS3xs1eqziN
         FWM2dAu3YpXLswTL/4LE+B7MDiiXtm1s9QZo6cB6PNYDqOyjsF4D3oj8xC6vC1+QiIBn
         Kfiw==
X-Forwarded-Encrypted: i=1; AJvYcCXZurmZ3mWlrl2nAENry0uPPybs9TZG8iqgBczoG9o+6t1yCv77lBt6WVCH4IvS3uDj8vM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzuOdLezmtPnqrCrTfWK1khCUHmZ8oub8Uqtb4kSfCaD34FdW38
	i3UiQhivQ7SqWhW9iIJh5U6kQq688kPEvwus3Q+9vu+LA1Gnj1aB5O5KYyaTrxI/9KqDt/9G/Z1
	wAG0RSz904adWQ0nLM8Qawz9e3XG+EPs=
X-Gm-Gg: AZuq6aIzvgIiwhi7l5ogT13pex2xSEk7j2ReRJ1cWBu9nRy5MD2AKB4wkruZUyz7Khd
	dKPJevabqbYzOFxCnzgyuyc/eFlYtthOL6dJShJ61OJVkGSoa4KHQ7KbJOiCSUV+Z+tA/FdJRIU
	fvqRB7uhsChg5gjGVtOG4aAmEpxbl9e3fxwP7bjyvB0M0pLf0aaNMjodOJSfdyOkh6536O7RzcY
	SsOWMEQX1C8LDWDInVvWXmZr6EUyGN5fWr+tgbcPaUyBDejDjxneI8zxogYtBCQ50Bxn76wekBM
	s2zSfFk8yr75mSc9ugxG3ioxVyArntg6GtoQ3UuagqcBZfTUMUlP97P/NOrdEtwnZBQxLPz4SDc
	tXUbG9RWWqOB0wg==
X-Received: by 2002:a05:7022:128d:b0:11b:f271:835a with SMTP id
 a92af1059eb24-124b100d8camr2199762c88.3.1769702377004; Thu, 29 Jan 2026
 07:59:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
In-Reply-To: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Jan 2026 18:02:21 +0200
X-Gm-Features: AZwV_Qh0LikHrjwYELL0Qb32OlZcL13Rg7Wtaiv5oFtOG766mVjbDDliX8TbUzs
Message-ID: <CAEnQRZA-nMai9-CEdMqnr2drqBRXXPOKE3a+_3j4S_=x-bM0pQ@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: imx: Fix invalid loaded resource table detection
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Frank Li <frank.li@nxp.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 3:45=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
> resource table even when the current firmware does not provide one.
>
> When the device tree contains a "rsc-table" entry, priv->rsc_table is
> non-NULL and denotes where a resource table would be located if one is
> present in memory. However, when the current firmware has no resource
> table, rproc->table_ptr is NULL. The function still returns
> priv->rsc_table, and the remoteproc core interprets this as a valid loade=
d
> resource table.
>
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() whe=
n
> there is no resource table for the current firmware (i.e. when
> rproc->table_ptr is NULL). This aligns the function's semantics with the
> remoteproc core: a loaded resource table is only reported when a valid
> table_ptr exists.
>
> With this change, starting firmware without a resource table no longer
> triggers a crash.
>
> Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for fi=
nd_loaded_rsc_table")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Changes looks good to  me >

> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rp=
roc, const struct firmware *
>  {
>         struct imx_rproc *priv =3D rproc->priv;
>
> +       /* No resource table in the firmware */
> +       if (!rproc->table_ptr)
> +               return NULL;

I wonder if we can make this change generic because it should happen
on other platforms also.

Maybe something like this:

remoteproc: core: Only copy loaded table when valid

Copy resource table in memory only when:
* the current loaded firmware provides one
AND
* there is an explicit request to have the rsc table copied in memory
via rsc-table

--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1281,7 +1281,7 @@ static int rproc_start(struct rproc *rproc,
const struct firmware *fw)
         * that any subsequent changes will be applied to the loaded versio=
n.
         */
        loaded_table =3D rproc_find_loaded_rsc_table(rproc, fw);
-       if (loaded_table) {
+       if (rproc->cached_table && loaded_table) {
                memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
                rproc->table_ptr =3D loaded_table;
        }
