Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A8617EF;
	Sat, 30 Sep 2023 07:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4529CC433C8;
	Sat, 30 Sep 2023 07:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696057866;
	bh=uitPAuLXQzhXilHTIpvqtk9kQIqduwY9RVC6sBsvOiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUE2Ph2o0i0DWgBaHgpxJw5JD3j1tE1JaRbXJ3o6FnUoG96xdEbbBAcSgCIzLwUmK
	 zQWgogax/YpixWjH7OWsCZwdAfW548XE83Grji1FmUU4Jc/xm3aMFFrKoaDCgUwhFs
	 YedG4T2n6FYTTtDevgZdb6dOpF+17u6aqrEam8C8=
Date: Sat, 30 Sep 2023 09:11:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: vkoul@kernel.org, bhe@redhat.com, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, rafael@kernel.org
Subject: Re: [PATCH 1/1] fs: debugfs: fix build error at powerpc platform
Message-ID: <2023093029-chalice-violation-c349@gregkh>
References: <20230929164920.314849-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929164920.314849-1-Frank.Li@nxp.com>

On Fri, Sep 29, 2023 at 12:49:20PM -0400, Frank Li wrote:
>    ld: fs/debugfs/file.o: in function `debugfs_print_regs':
>    file.c:(.text+0x95a): undefined reference to `ioread64be'
> >> ld: file.c:(.text+0x9dd): undefined reference to `ioread64'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309291322.3pZiyosI-lkp@intel.com/
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

What commit id does this fix?

> ---
>  fs/debugfs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
> index 5b8d4fd7c747..b406283806d9 100644
> --- a/fs/debugfs/file.c
> +++ b/fs/debugfs/file.c
> @@ -1179,7 +1179,7 @@ void debugfs_print_regs(struct seq_file *s, const struct debugfs_reg *regs,
>  			seq_printf(s, "%s = 0x%04x\n", regs->name,
>  				  b ? ioread16be(reg) : ioread16(reg));
>  			break;
> -#ifdef CONFIG_64BIT
> +#if defined(ioread64) && defined (ioread64be)

Are you sure this is equivalent?  What if these are functions?

thanks,

greg k-h
