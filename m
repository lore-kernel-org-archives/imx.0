Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A575D38CFF7;
	Fri, 13 Mar 2026 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398642; cv=none; b=qdED+RgkcJ6vhhm8nP2VMMwoZJEYZb+XyZNNcSqGGa0xjArOEHlNK1zIh3V3dsZ6N6kXs0JuEwxaDFehi3kdgUXK02j+3Gu6Fym4Tkwtv0/9esw/9vJ7pSzmRLpwgtATB0Zbop1ZeOwqwVXSf/PdHPo+lpxwQubSTFhYDFB3cLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398642; c=relaxed/simple;
	bh=cTEoqJ4gEQuPI80YrHpvT5IQpT9R13pIvXiC08MEgeQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pnM6rqijvFyEJ8KjIcQJYonr9acq8kXG6gJ/XooZhhEgHxEW+P0K5qACr5go64DxyGcg4w9nFOUzuwRG17mIOtVaATev8zOFwpurAqQ+DvR4nbsEvl9yQ3DJfkUhn7TfXYjlM27BEMiXYGLBD7ETh+TfhTjL3b+nctKCsGIh3Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFGdZ6JF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFGdZ6JF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B58EC19421;
	Fri, 13 Mar 2026 10:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773398642;
	bh=cTEoqJ4gEQuPI80YrHpvT5IQpT9R13pIvXiC08MEgeQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tFGdZ6JFfP+CqaVXaYvo+L5HcpcxtSoK8Wq3Kz5iKhvJTzN1nA7VlRQTYPgqEPHUS
	 K0oc/cMiHguNI7jh5QbzHIkUp0+3/CT6G9NHcVgLdtiXwRy4QJcsvwfVAwEVes3W2R
	 BFwEGFkPjiFg1SlF0JXOMx0/ZHxL86cCyTnlDC2BMFeNFIE6w8v4UM+PpHjNz18xh7
	 f7aa/QWZpZ5wLSN1m5jVtR2Bvr4iybwb/N44xFgfv31dDX/CTCH2Nsi5Wd8PoxYJUG
	 LnCD6U9iOzzmUoehVdG3Iwartke4E5VvgVnnlc8MFOdOvPiU8+OYz5tnrTb4lH287n
	 Bob0Qdm6edH6A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav <p.yadav@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev
Subject: Re: [PATCH] mtd: spi-nor: core: correct the op.dummy.nbytes when
 check read operations
In-Reply-To: <20251208-spi-nor-v1-1-f6669a645395@nxp.com> (Haibo Chen's
	message of "Mon, 08 Dec 2025 17:14:14 +0800")
References: <20251208-spi-nor-v1-1-f6669a645395@nxp.com>
Date: Fri, 13 Mar 2026 10:43:58 +0000
Message-ID: <2vxzh5qkf1qp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Dec 08 2025, Haibo Chen wrote:

> When check read operation, need to setting the op.dummy.nbytes based
> on current read operation rather than the nor->read_proto.
>
> Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied to spi-nor/next. Thanks.

[...]

-- 
Regards,
Pratyush Yadav
