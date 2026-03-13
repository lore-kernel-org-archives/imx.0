Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D42311C35;
	Fri, 13 Mar 2026 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399861; cv=none; b=cljVQGBSu+OLT/xiV2JaPFU9wnpMiNxLddSB7+Bs/Pkjra2gl76lwp02+QVsdl4WnLzIdh3Qh5z7jclSCrIQPVXt5IDcQ0qKg1ysrq2B8vos76yda6kijMbo87ucjG2uUvotyms3U5/TJQe8ELQinQZjsSugaK+hgobmPEoW8I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399861; c=relaxed/simple;
	bh=aDY7aDvju9S0EycKm7uyON4BJEJMwtI97NvuRv3BhK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DTaeOVNgbSt2iDypNY8CeH+U7627VQuQUoC/5BD+1GGADhCLQNUP1GVFx2UuOz/t/3QBR4FpEbtjAbr31EXlyO6B8QlBKqAGckyRcaJoGmuOcStgz7PYwWa34gc/2yjb55Louxmx+fkHrxL4I74L3uBptHN3MJ8e1BveJvnXDQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdaxiyrt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdaxiyrt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EC0C19421;
	Fri, 13 Mar 2026 11:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773399861;
	bh=aDY7aDvju9S0EycKm7uyON4BJEJMwtI97NvuRv3BhK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tdaxiyrtxhzO4ftXor8cTENoD/FIZTK68iKKFalpNdkeHI1FSjWQgh1SPwgua8p7D
	 rPdyXyu30pSK1YBAFK8tE9J0oIRLBQNZhAbJ0f1zcb5fAIBMFrpGHHmKs2pYmP/l/e
	 B4GRER4/pwo1Lt5EW52R33Qqx2RkQEkoEXB9TAHSxdfMLnu0XOYlEdKGUUpt3Elv4D
	 zPb15B3TEiD161LQ9MBn6bZ8FHWfB/8VvX31WVREFID/zrIR4kC74emWcKY53UD6z/
	 r6LzM2sR7qPMjm7XfzBfFYVhVHcYV73HtFXdAYLWQTVC7hUlcAJLgMTMFboYxDlttC
	 OkF+sTFjUHrkA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,  han.xu@nxp.com
Subject: Re: [PATCH v3] mtd: spi-nor: micron-st: add SNOR_CMD_PP_8_8_8_DTR
 sfdp fixup for mt35xu512aba
In-Reply-To: <20251223-nor-v3-1-09e26797a8b5@nxp.com> (Haibo Chen's message of
	"Tue, 23 Dec 2025 11:01:02 +0800")
References: <20251223-nor-v3-1-09e26797a8b5@nxp.com>
Date: Fri, 13 Mar 2026 11:04:17 +0000
Message-ID: <2vxz8qbwf0su.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Dec 23 2025, Haibo Chen wrote:

> Find two batches mt35xu512aba has different SFDP but with same
> jedec ID. The batch which use the new version of SFDP contain
> all the necessary information to support OCT DTR mode. The batch
> with old version do not contain the OCT DTR command information,
> but in fact it did support OCT DTR mode.
>
> Current mt35xu512aba_post_sfdp_fixup() add some setting including
> SNOR_CMD_READ_8_8_8_DTR, but still lack SNOR_CMD_PP_8_8_8_DTR. Meet
> issue on the batch mt35xu512aba with old SFDP version. Because no
> SNOR_CMD_PP_8_8_8_DTR, micron_st_nor_octal_dtr_en() will not be
> called, then use SNOR_CMD_READ_8_8_8_DTR will meet issue.
>
> Fixes: 44dd635cd632 ("mtd: spi-nor: micron-st: use SFDP of mt35xu512aba")
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied to spi-nor/next. Thanks!

[...]

-- 
Regards,
Pratyush Yadav
